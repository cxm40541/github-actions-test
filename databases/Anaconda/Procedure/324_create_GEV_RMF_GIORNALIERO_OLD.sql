/****** Object:  StoredProcedure [dbo].[GEV_RMF_GIORNALIERO_OLD]    Script Date: 11/17/2025 15:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[GEV_RMF_GIORNALIERO_OLD]
AS
 
 DECLARE @OGGI  CHAR(8)
 SELECT @OGGI = CONVERT(VARCHAR, GETDATE(),112)
 
-- inserimento in RMF_NORMALIZZATO records mancanti, 
-- presenti su lsrpvo
 
insert into RMF_20040330_NORMALIZZATO
select   lsr01a_key_id_ricev
  ,lsr01a_comune_ricev
  ,lsr01a_cap
  ,lsr01a_prov_ricev
  ,lsr01a_indirizzo
  ,lsr01a_tel_ricevitoria
from  [sql-dbsan1\a].condiviso.dbo.lsr01a a
where  lsr01a_key_id_ricev in (
 select distinct lsrpvo_key_id_ricev 
 from lsrpvo
)
and not exists (
 select * 
 from RMF_20040330_NORMALIZZATO xa 
 where xa.codricev = a.lsr01a_key_id_ricev
)

exec GEV_AGGIORNA_OPERATORE_DOPO_CI @oggi
 
 --********************************************
 --** CAMBIAMENTI DI STATO - Nome Tabella: ##CS
 --********************************************
 --DROP TABLE ##CS
 --Se è una disattivazione prendo l'anagrafica da IERI.LSR01A
 --altrimenti la prendo da OGGI.LSR01A
 
 SELECT  COD_LOTT = OGGI.LSR01A_KEY_ID_RICEV,
         TIPO_MOV = CASE WHEN OGGI.LSR01A_TAB_GIOCHI_09 = '2' or OGGI.LSR01A_TAB_GIOCHI_09 = '0' --caso martellamento
                         THEN 'D'
                         WHEN OGGI.LSR01A_TAB_GIOCHI_09='1' and IERI.LSR01A_TAB_GIOCHI_09='2' THEN 'R'
                         ELSE 'A' END,
         DENOMINAZIONE = CASE WHEN OGGI.LSR01A_TAB_GIOCHI_09='2' or OGGI.LSR01A_TAB_GIOCHI_09='0' --caso martellamento
                              THEN LEFT(IERI.LSR01A_DECOD_RICEV,30)
                              ELSE LEFT(OGGI.LSR01A_DECOD_RICEV,30) END,
         INDIRIZZO = LEFT(NORMA.INDIRIZZO,50),
         --COMUNE=   LEFT(LSR01A_COMUNE_RICEV,25),
         COMUNE = NORMA.COMUNE,
         CAP = NORMA.CAP,
         PROVINCIA = NORMA.PROV,
         --TEL_RICEV = LEFT(REPLACE(OGGI.LSR01A_TEL_RICEVITORIA,'/',''),12),
         TEL_RICEV = dbo.f_gev_calcola_telefono(OGGI.LSR01A_TEL_RICEVITORIA),
         ASSOCIAZIONE = OGGI.LSR01A_ASSOCIAZIONE,
         N_TERM = OGGI.LSR01A_TERM_INST,

         OPERATORE = lsrpvo_operatore,
         GG_CONTATTO = lsrpvo_gg_contatto,

         lsrpvo_data_invio_SGI, -- se valorizzata mandare gli update altrimenti gli add dei terminali
         SALES_ALLOWED = CASE WHEN OGGI.LSR01A_TAB_GIOCHI_09='1' THEN 'Y' ELSE 'N' END,
         FREQUENZA = dbo.f_gev_calcola_frequenza( null, lsrpvo_classe, lsrpvo_operatore)
 /*
  FREQUENZA = CASE WHEN lsrpvo_classe='A' OR lsrpvo_classe='T' THEN '07'
                   WHEN lsrpvo_classe='B' THEN '14'
                   WHEN lsrpvo_classe='C' THEN
                   CASE WHEN lsrpvo_operatore like 'TO%' OR lsrpvo_operatore = 'TLT' THEN '21' ELSE '28' END
                   WHEN (lsrpvo_classe = 'D' AND lsrpvo_operatore LIKE 'M%') THEN '14'
              ELSE '  ' END
 */
 INTO ##CS --** 
 FROM  CONDIVISO.DBO.LSR01A_IERI IERI,
       CONDIVISO.DBO.LSR01A OGGI,
 (
       SELECT *
       FROM RMF_20040330_NORMALIZZATO
 ) NORMA,
 (
       SELECT *
       FROM lsrpvo
       join gev_decod_ltm_sgi
       on (left(lsrpvo_key_id_ricev,2) = rete_ltm)
       where Key_Desc not in ( 'DEADIS' ,'POSM' ,'TOTOBIT' ,'AUTOGRILL')
 ) CONTRATTI
 WHERE  IERI.LSR01A_KEY_ID_RICEV = OGGI.LSR01A_KEY_ID_RICEV
 AND    OGGI.LSR01A_KEY_ID_RICEV = codricev
 AND    OGGI.LSR01A_KEY_ID_RICEV = lsrpvo_key_id_ricev
 AND    IERI.LSR01A_TAB_GIOCHI_09 <> OGGI.LSR01A_TAB_GIOCHI_09
 -- AND LSR01A_TERM_INST > '00'
 
 --***************************************************
 --** MODIFICHE ANAGRAFICHE (NON CAMBIAMENTI DI STATO)
 --** - Nome Tabella: ##MA
 --** Per adesso le modifiche anagrafiche sono
 --** soltanto quelle del ricevitore (denominazione)
 --** Successivamente avremo anche quelle della ricevitoria
 --***************************************************
 
 --DROP TABLE ##MA
 SELECT     COD_LOTT = OGGI.LSR01A_KEY_ID_RICEV,
            TIPO_MOV = ' ',
            DENOMINAZIONE = LEFT(OGGI.LSR01A_DECOD_RICEV,30),
            INDIRIZZO = LEFT(NORMA.INDIRIZZO,50),
            --COMUNE = LEFT(LSR01A_COMUNE_RICEV,25),
            COMUNE = NORMA.COMUNE,
            CAP = NORMA.CAP,
            PROVINCIA = NORMA.PROV,
            --TEL_RICEV = LEFT(REPLACE(OGGI.LSR01A_TEL_RICEVITORIA,'/',''),12),
            TEL_RICEV = dbo.f_gev_calcola_telefono(OGGI.LSR01A_TEL_RICEVITORIA),
            ASSOCIAZIONE = OGGI.LSR01A_ASSOCIAZIONE,
            N_TERM = OGGI.LSR01A_TERM_INST,

            OPERATORE = lsrpvo_operatore,
            GG_CONTATTO = lsrpvo_gg_contatto,

            SALES_ALLOWED = 'Y', --perchè prenderò le modifiche di quelle attive nello step successivo
            --lsrpvo_data_invio_SGI -- se valorizzata mandare gli update altrimenti gli add dei terminali
            FREQUENZA = dbo.f_gev_calcola_frequenza( null, lsrpvo_classe, lsrpvo_operatore),
 /*
  FREQUENZA = CASE WHEN lsrpvo_classe='A' OR lsrpvo_classe='T' THEN '07'
                   WHEN lsrpvo_classe='B' THEN '14'
                   WHEN lsrpvo_classe='C' THEN
                   CASE WHEN lsrpvo_operatore like 'TO%' OR lsrpvo_operatore = 'TLT' THEN '21' ELSE '28' END
                   WHEN (lsrpvo_classe = 'D' AND lsrpvo_operatore LIKE 'M%') THEN '14'
              ELSE '  ' END,
 */
            POSTAZIONE = '0',
            TIPO_TERM = '8',
            RET_STATUS = 'A',
            RET_ACTION = 'U',
            TERM_STATUS = 'A',
            TERM_ACTION = 'N'
 INTO  ##MA
 FROM  CONDIVISO.DBO.LSR01A_IERI IERI,
       CONDIVISO.DBO.LSR01A OGGI,
 (
    SELECT *
    FROM RMF_20040330_NORMALIZZATO
 ) NORMA,
 (
	SELECT *
	FROM lsrpvo
	join gev_decod_ltm_sgi
	on (left(lsrpvo_key_id_ricev,2) = rete_ltm)
	where Key_Desc not in ( 'DEADIS' ,'POSM' ,'TOTOBIT' ,'AUTOGRILL')
 ) CONTRATTI
 WHERE  IERI.LSR01A_KEY_ID_RICEV = OGGI.LSR01A_KEY_ID_RICEV
 AND    OGGI.LSR01A_KEY_ID_RICEV = codricev
 AND    OGGI.LSR01A_KEY_ID_RICEV = lsrpvo_key_id_ricev
 AND   (IERI.LSR01A_DECOD_RICEV <> OGGI.LSR01A_DECOD_RICEV
     OR IERI.LSR01A_TEL_RICEVITORIA <> OGGI.LSR01A_TEL_RICEVITORIA 
     OR IERI.LSR01A_PROV_RICEV <> OGGI.LSR01A_PROV_RICEV)
 /*
     OR IERI.LSR01A_INDIRIZZO <> OGGI.LSR01A_INDIRIZZO
     OR IERI.LSR01A_COMUNE_RICEV <> OGGI.LSR01A_COMUNE_RICEV
     OR IERI.LSR01A_CAP <> OGGI.LSR01A_CAP
     OR IERI.LSR01A_PROV_RICEV <> OGGI.LSR01A_PROV_RICEV
     OR IERI.LSR01A_TEL_RICEVITORIA <> OGGI.LSR01A_TEL_RICEVITORIA)
 */
 AND OGGI.LSR01A_KEY_ID_RICEV NOT IN (SELECT COD_LOTT FROM ##CS)
 
 --*************************************
 --* Invio le modifiche anagrafiche solo
 --* delle ricevitorie attive
 --*************************************
 --DROP TABLE ##MA_GV
 SELECT T.*
 INTO ##MA_GV
 FROM ##MA T,
 (
  SELECT *
  FROM condiviso.dbo.lsr01a
  WHERE LSR01A_TAB_GIOCHI_09 = '1'
 )LSR
 WHERE T.COD_LOTT = LSR.lsr01a_key_id_ricev
 DROP TABLE ##MA
 
 --***************************************************
 --** INCREMENTI TERMINALI + DECREMENTI TERMINALI
 --** Nome Tabella: ##IT_DT
 --***************************************************
 ---DROP TABLE ##IT_DT
 
 SELECT  *
 INTO    ##IT_DT
 FROM
 (
  --** INCREMENTO TERMINALI - IT
  SELECT COD_LOTT = TERM_OGGI.LST02A_RICEVITORIA, --42690
         POSTAZIONE = TERM_OGGI.LST02A_TERMINALE,
         TIPO_TERM = CASE SUBSTRING(TERM_OGGI.LST02A_MATRICOLA,1,1)
                     WHEN '1' THEN '2'
                     WHEN '2' THEN '2'
                     WHEN '3' THEN '4'
                     WHEN '4' THEN '5'
                     WHEN '5' THEN '6'
                     ELSE '8' END,
         TIPOAZIONE = '2'
  from
  (
      select * --43050
      from   condiviso.dbo.lst02a
      where  lst02a_ricevitoria <> ''
      and    LST02A_STATO_TERM = '1'
  )TERM_OGGI
  left outer join
  (
      select * --360
      from   condiviso.dbo.lst02a_ieri
      where  lst02a_ricevitoria <> ''
      and    LST02A_STATO_TERM = '1'
  )TERM_IERI
  on TERM_OGGI.lst02a_ricevitoria + TERM_OGGI.lst02a_terminale = TERM_IERI.lst02a_ricevitoria + TERM_IERI.lst02a_terminale
  where TERM_IERI.lst02a_ricevitoria + TERM_IERI.lst02a_terminale is null
  UNION
  --** DECREMENTO TERMINALI - DT
  SELECT COD_LOTT=TERM_IERI.LST02A_RICEVITORIA, --42690
  POSTAZIONE=TERM_IERI.LST02A_TERMINALE,
  -- Attenzione: se il progressivo terminale è 1
  -- bisogna mandare il record di sospensione della ricevitoria
  --SOSPENSIONE=case when TERM_IERI.lst02a_terminale='1' then 'SI' else 'NO' end,
  TIPO_TERM = CASE SUBSTRING(TERM_IERI.LST02A_MATRICOLA,1,1)
         WHEN '1' THEN '2'
         WHEN '2' THEN '2'
         WHEN '3' THEN '4'
         WHEN '4' THEN '5'
         WHEN '5' THEN '6'
         ELSE '8' END,
  TIPOAZIONE='9'
  from
  (
  select * --360
  from condiviso.dbo.lst02a_ieri
  where LST02A_STATO_TERM='1' and lst02a_ricevitoria<>''
  )TERM_IERI left outer join
  (
  select * --43050
  from condiviso.dbo.lst02a
  where LST02A_STATO_TERM='1' and lst02a_ricevitoria<>''
  )TERM_OGGI
  on TERM_IERI.lst02a_ricevitoria+TERM_IERI.lst02a_terminale=
  TERM_OGGI.lst02a_ricevitoria+TERM_OGGI.lst02a_terminale
  where TERM_OGGI.lst02a_ricevitoria+TERM_OGGI.lst02a_terminale is null
 )IT_DT
 
 --DROP TABLE ##IT_DT_GV
 -- scelgo tra le variazioni di terminali quelle
 -- relative ai punti vendita che sono stati attivati almeno una volta al G&V
 -- in passato, ma non oggi, cioè non stanno in ##CS!!!
 -- AGGIUNTA DEL 15/02/2005
 -- e che non sono EX-TWIN
 
 SELECT
 COD_LOTT=  LSR01A_KEY_ID_RICEV,
 TIPO_MOV=' ',
 DENOMINAZIONE= LEFT(LSR01A_DECOD_RICEV,30),
 INDIRIZZO=  LEFT(NORMA.INDIRIZZO,50),
 --COMUNE=   LEFT(LSR01A_COMUNE_RICEV,25),
 COMUNE=   NORMA.COMUNE,
 CAP=   NORMA.CAP,
 PROVINCIA=  NORMA.PROV,
 --TEL_RICEV=  LEFT(REPLACE(LSR01A_TEL_RICEVITORIA,'/',''),12),
 TEL_RICEV = dbo.f_gev_calcola_telefono(LSR01A_TEL_RICEVITORIA),
 ASSOCIAZIONE= LSR01A_ASSOCIAZIONE,
 N_TERM=   LSR01A_TERM_INST,

 OPERATORE = lsrpvo_operatore,
 GG_CONTATTO = lsrpvo_gg_contatto,

 SALES_ALLOWED='Y',

 FREQUENZA = dbo.f_gev_calcola_frequenza( null, lsrpvo_classe, lsrpvo_operatore)
 /*
  FREQUENZA = CASE WHEN lsrpvo_classe='A' OR lsrpvo_classe='T' THEN '07'
                   WHEN lsrpvo_classe='B' THEN '14'
                   WHEN lsrpvo_classe='C' THEN
                   CASE WHEN lsrpvo_operatore like 'TO%' OR lsrpvo_operatore = 'TLT' THEN '21' ELSE '28' END
                   WHEN (lsrpvo_classe = 'D' AND lsrpvo_operatore LIKE 'M%') THEN '14'
              ELSE '  ' END
 */
 ,
 --lsrpvo_data_invio_SGI -- se valorizzata mandare gli update altrimenti gli add dei terminali
 --perchè considero le variazioni dei terminali delle sole attive
 POSTAZIONE,
 TIPO_TERM,
 --RET_STATUS=CASE WHEN LSR.LSR01A_TAB_GIOCHI_09='2' or LSR.LSR01A_TAB_GIOCHI_09='0' --caso martellamento
 --        THEN 'I' ELSE 'A' END,
 RET_STATUS='A',
 RET_ACTION='N',
 --TERM_STATUS=CASE WHEN LSR.LSR01A_TAB_GIOCHI_09='2' or LSR.LSR01A_TAB_GIOCHI_09='0' --caso martellamento
 --        THEN 'I' ELSE 'A' END,--incremento+attivazione
 TERM_STATUS='A',
 TERM_ACTION=case WHEN TIPOAZIONE='2' then 'A' --incremento
    else 'D' end
 INTO ##IT_DT_GV
 FROM
 (
  SELECT *
  FROM ##IT_DT
  WHERE COD_LOTT NOT LIKE '%X%'
 )T,
 (
  SELECT *
  FROM condiviso.dbo.lsr01a
  WHERE LSR01A_TAB_GIOCHI_09>'0'
 )LSR, 
 (
  SELECT *
  FROM RMF_20040330_NORMALIZZATO
 )NORMA,
 (
	SELECT *
	FROM lsrpvo
	join gev_decod_ltm_sgi
	on (left(lsrpvo_key_id_ricev,2) = rete_ltm)
	where Key_Desc not in ( 'DEADIS' ,'POSM' ,'TOTOBIT' ,'AUTOGRILL')
 )CONTRATTI
 WHERE T.COD_LOTT=LSR.lsr01a_key_id_ricev
 AND LSR01A_KEY_ID_RICEV=codricev
 AND LSR01A_KEY_ID_RICEV=lsrpvo_key_id_ricev
 AND T.COD_LOTT NOT IN
 (SELECT COD_LOTT FROM ##CS)
 AND T.COD_LOTT NOT LIKE '%X%'
 
 DROP TABLE ##IT_DT
 
 --Incrocio i cambiamenti di stato ##CS solo per ircevitorie non EX-TWIN
 --con i terminali LST02A per inviare tutte le postazioni:
 -- solo per le ricevitorie attive TIPO_MOV='A' che non sono
 -- state già inviate con la procedura RMF_CONTRATTUALIZZATE,
 --DROP TABLE ##CS_NADR_GV
 
 SELECT
 COD_LOTT,
 TIPO_MOV,
 DENOMINAZIONE,
 INDIRIZZO,
 --COMUNE=   LEFT(LSR01A_COMUNE_RICEV,25),
 COMUNE,
 CAP,
 PROVINCIA,
 TEL_RICEV,
 ASSOCIAZIONE,
 N_TERM,
 OPERATORE,
 GG_CONTATTO,
 SALES_ALLOWED,
 FREQUENZA,
 POSTAZIONE=LST02A_TERMINALE,
 TIPO_TERM,
 RET_STATUS,
 RET_ACTION=CASE WHEN TIPO_MOV='A' AND LST02A_TERMINALE='1' THEN 'A'
        WHEN TIPO_MOV='A' AND LST02A_TERMINALE>'1' THEN 'N'
     ELSE RET_ACTION END,
 TERM_STATUS,
 TERM_ACTION
 INTO ##CS_NADR_GV --Nuove attivazioni, Disattivazioni, Riattivazioni
 FROM
 (
  -- TIPO 1
  SELECT CS.*,
     RET_STATUS= 'A',
     RET_ACTION=' ',
     TERM_STATUS='A',
     TERM_ACTION='A'
  FROM
  (  
   /*--scelgo solo quelli con lsrpvo_data_invio_SGI Null
   SELECT *
   FROM ##CS
   WHERE lsrpvo_data_invio_SGI Is Null
   AND TIPO_MOV='A'
   */
   SELECT *
   FROM ##CS
   WHERE TIPO_MOV='A'
   and lsrpvo_data_invio_SGI Is Null
   and COD_LOTT not in
   (
    select substring([External Retailer],2,6)
    from gev_rmf_dettaglio_new
   )
  )CS
 )CS_NADR,
 (
  SELECT 
  LST02A_RICEVITORIA,
  LST02A_TERMINALE,
  TIPO_TERM = CASE SUBSTRING(LST02A_MATRICOLA,1,1)
       WHEN '1' THEN '2'
       WHEN '2' THEN '2'
       WHEN '3' THEN '4'
       WHEN '4' THEN '5'
       WHEN '5' THEN '6'
       ELSE '8' END
  FROM CONDIVISO.DBO.LST02A
  WHERE LST02A_STATO_TERM='1'
 )TERMINALI
 WHERE COD_LOTT=LST02A_RICEVITORIA
 AND COD_LOTT NOT LIKE '%X%'
 
 --SOLO PER LE EX-TWIN che non è detto si trovino nella tabella LST02A
 
 INSERT INTO ##CS_NADR_GV --Nuove attivazioni, Disattivazioni, Riattivazioni
 SELECT
 COD_LOTT,
 TIPO_MOV,
 DENOMINAZIONE,
 INDIRIZZO,
 --COMUNE=   LEFT(LSR01A_COMUNE_RICEV,25),
 COMUNE,
 CAP,
 PROVINCIA,
 TEL_RICEV,
 ASSOCIAZIONE,
 N_TERM,
 OPERATORE,
 GG_CONTATTO,
 SALES_ALLOWED,
 FREQUENZA,
 POSTAZIONE='1',
 TIPO_TERM='8',
 RET_STATUS,
 RET_ACTION=CASE WHEN TIPO_MOV='A' THEN 'A'    
   ELSE RET_ACTION END,
 TERM_STATUS,
 TERM_ACTION
 FROM
 (
  -- TIPO 1
  SELECT CS.*,
     RET_STATUS= 'A',
     RET_ACTION=' ',
     TERM_STATUS='A',
     TERM_ACTION='A'
  FROM
  (  
   /*--scelgo solo quelli con lsrpvo_data_invio_SGI Null
   SELECT *
   FROM ##CS
   WHERE lsrpvo_data_invio_SGI Is Null
   AND TIPO_MOV='A'
   */
   SELECT *
   FROM ##CS
   WHERE TIPO_MOV='A'
   and lsrpvo_data_invio_SGI Is Null
   and COD_LOTT not in
   (
    select substring([External Retailer],2,6)
    from gev_rmf_dettaglio_new
   )
  )CS
 )CS_NADR
 WHERE (
  COD_LOTT LIKE '%X%'
 OR  COD_LOTT LIKE 'A0%'
 OR  COD_LOTT LIKE 'A1%'
 OR  COD_LOTT LIKE 'A2%'
 OR  COD_LOTT LIKE 'A3%'
 OR  COD_LOTT LIKE 'A4%'
 OR  COD_LOTT LIKE 'A5%'
 OR  COD_LOTT LIKE 'A6%'
 OR  COD_LOTT LIKE 'A7%'
 OR  COD_LOTT LIKE 'A8%'
 OR  COD_LOTT LIKE 'A9%'
 )
 
 -- Inserisco i cambiamenti di stato ##CS solo per ricevitorie non EX-TWIN
 -- e per le TWIN
 -- per le ricevitorie disattive TIPO_MOV='D'
 -- per le ricevitorie riattivate TIPO_MOV='R'
 
 INSERT INTO ##CS_NADR_GV
 SELECT
 COD_LOTT,
 TIPO_MOV,
 DENOMINAZIONE,
 INDIRIZZO,
 --COMUNE=   LEFT(LSR01A_COMUNE_RICEV,25),
 COMUNE,
 CAP,
 PROVINCIA,
 TEL_RICEV,
 ASSOCIAZIONE,
 N_TERM,
 OPERATORE,
 GG_CONTATTO,
 SALES_ALLOWED,
 FREQUENZA,
 POSTAZIONE='0',
 TIPO_TERM='8',
 RET_STATUS,
 RET_ACTION,
 TERM_STATUS,
 TERM_ACTION
 FROM
 (
  --TIPO 2
  SELECT CS.*,
     --RET_STATUS= 'I',
     RET_STATUS= 'A',
     RET_ACTION= 'U',
     TERM_STATUS='A',
     TERM_ACTION='N'
  FROM
  (  
   --scelgo solo quelli con lsrpvo_data_invio_SGI Null
   SELECT *
   FROM ##CS
   WHERE TIPO_MOV='D'
  )CS
  UNION
  --TIPO 3
  SELECT CS.*,
     RET_STATUS= 'A',
     RET_ACTION= 'U',
     TERM_STATUS='A',
     TERM_ACTION='N'
  FROM
  (  
   --scelgo solo quelli con lsrpvo_data_invio_SGI Null
   SELECT *
   FROM ##CS
   WHERE TIPO_MOV='R'
  )CS
 )CS_NADR
 

 --****************************************************
 --* Creo tabella temporanea dove appoggiare
 --* le ricevitorie per le quali devo aggiornare
 --* la data_invio_SGI su lsrpvo.
 --* Si tratta delle eventuali ricevitorie da attivare
 --* non ancora contrattualizzate
 --****************************************************
 
 SELECT COD_LOTT
 INTO TMP_ATTIVE_NO_CONTRATTO
 FROM ##CS_NADR_GV
 WHERE TIPO_MOV='A'
 
 /*
 update lsrpvo
 set lsrpvo_data_invio_SGI=@OGGI
 from
 (
  SELECT COD_LOTT
  FROM TMP_ATTIVE_NO_CONTRATTO
 )NA
 where lsrpvo_key_id_ricev=COD_LOTT
 */
 
 --** Inserisco infine tutte le attivazioni in
 --** ##CS che sono già state inviate ad SGI
 
 INSERT INTO ##CS_NADR_GV
 -- TIPO 4
 SELECT
 COD_LOTT,
 TIPO_MOV,
 DENOMINAZIONE,
 INDIRIZZO,
 COMUNE,
 CAP,
 PROVINCIA,
 TEL_RICEV,
 ASSOCIAZIONE,
 N_TERM,
 OPERATORE,
 GG_CONTATTO,
 SALES_ALLOWED='Y',
 FREQUENZA,
 POSTAZIONE='0',
 TIPO_TERM='8',
 RET_STATUS= 'A',
 RET_ACTION='U',
 TERM_STATUS='A',
 TERM_ACTION='N'
 FROM
 (  
  --scelgo solo quelli con lsrpvo_data_invio_SGI Null
 /* SELECT *
  FROM ##CS
  WHERE lsrpvo_data_invio_SGI Is Not Null
  AND TIPO_MOV='A'
 */
  SELECT *
  FROM ##CS
  WHERE TIPO_MOV='A'
  and (lsrpvo_data_invio_SGI Is Not Null or
  COD_LOTT in
  (
   select substring([External Retailer],2,6)
   from gev_rmf_dettaglio_new
  ))
 )GIA_INVIATE_A_SGI
 
 DROP TABLE ##CS
 --DROP TABLE ##GV
 SELECT *
 INTO ##GV
 FROM
 (
  SELECT *
  FROM ##MA_GV
  UNION
  SELECT *
  FROM ##IT_DT_GV
  UNION
  SELECT *
  FROM ##CS_NADR_GV
 )TUTTO
 

 DROP TABLE ##MA_GV
 DROP TABLE ##IT_DT_GV
 DROP TABLE ##CS_NADR_GV
 
 --RICERCA RID
 ---DROP TABLE ##RID
 
 SELECT *
 INTO #RID
 FROM [SQL-DBSAN1\A].CONDIVISO.DBO.LCR01A
 WHERE lcr01a_key_data_fine_val='99999999'
 and lcr01a_tipo_gioco='09'
 
 --** FINE CREAZIONE TABELLA #RID
 
 DELETE FROM GEV_RMF_GIORNALIERO_NEW
 INSERT INTO [ANACONDA].[DBO].[GEV_RMF_GIORNALIERO_NEW]
 SELECT
 -- COMPANY = CASE WHEN LEFT(COD_LOTT,1)='0' OR
 --    LEFT(COD_LOTT,1)='1' OR
 --    LEFT(COD_LOTT,1)='2' OR
 --    LEFT(COD_LOTT,1)='3' OR
 --    LEFT(COD_LOTT,1)='4' THEN 'CONI'
 --    ELSE 'LTM' END,
  COMPANY = KEY_DESC,
 -- CODSGI = Rete_SGI+Right(COD_LOTT,4),
  CODSGI = dbo.f_gev_codifica_ltm_sgi(COD_LOTT),
  CASE WHEN RTRIM(LTRIM(CONVERT(CHAR,POSTAZIONE)))='A' THEN '10'
    WHEN RTRIM(LTRIM(CONVERT(CHAR,POSTAZIONE)))='B' THEN '11'
    WHEN RTRIM(LTRIM(CONVERT(CHAR,POSTAZIONE)))='C' THEN '12'
    WHEN RTRIM(LTRIM(CONVERT(CHAR,POSTAZIONE)))='D' THEN '13'
    WHEN RTRIM(LTRIM(CONVERT(CHAR,POSTAZIONE)))='E' THEN '14'
    ELSE '0' + RTRIM(LTRIM(CONVERT(CHAR,POSTAZIONE))) END,
 -- CODSGIEXT = SUBSTRING(Rete_SGI,1,1) + LTRIM(COD_LOTT),
  CODSGIEXT = dbo.f_gev_codifica_ltm_sgi_ext(COD_LOTT),
  RET_STATUS, RET_ACTION, TERM_STATUS, TERM_ACTION,
  '       ', '          ', TIPO_TERM, DENOMINAZIONE, INDIRIZZO, COMUNE, CAP,
  --case when TEL_RICEV is null or LTRIM(TEL_RICEV)='' then '000000000000' else TEL_RICEV end,
   TEL_RICEV,
   OPERATORE, '999999999', case when GG_CONTATTO is null then '1' else GG_CONTATTO end, FREQUENZA, DENOMINAZIONE, '03', SALES_ALLOWED,
   TIPOPAG=CASE WHEN LCR01A_KEY_ID_RICEV IS NULL THEN 'C' ELSE 'E' END,
   BANCA=CASE WHEN LCR01A_KEY_ID_RICEV IS NULL THEN REPLICATE(' ', 30)
      ELSE LEFT(LCR01A_DESCRIZIONE + REPLICATE(' ', 30),30) END,
    -- RIGHT('0000' + RTRIM(LTRIM(ASSOCIAZIONE)),4),
      dbo.f_gev_calcola_merceologica(COD_LOTT),
   SUBSTRING(Rete_SGI,1,1), '1', '0000000',LEFT(PROVINCIA+SPACE(20),20),
   dbo.f_gev_calcola_commento(KEY_DESC,COD_LOTT)
   --SPACE(40)
 FROM ##GV 
 INNER JOIN  GEV_Decod_LTM_SGI ON left(COD_LOTT,2)=Rete_LTM
 LEFT OUTER JOIN #RID ON COD_LOTT=LCR01A_KEY_ID_RICEV
 WHERE Key_Desc not in ( 'DEADIS' ,'POSM' ,'TOTOBIT' ,'AUTOGRILL')
 
 DROP TABLE #RID
 DROP TABLE ##GV
 
 -- il primo invio della catena A% verso itgs
 -- DEVE essere 'Inactive' e SALES ALLOWED NO
 -- TSR blank
 -- in quanto gestito al rientro da TOTOBIT
  update gev_rmf_giornaliero_new
  set
   [Terminal Type] = '1'
  WHERE Company IN ('LTMP','ESSO','RISTOP','MOTOSPA','FINI','BLOCKB','PTSHOP','COOP','STANDA','EPOSG','SC910','SC911','SC912')
  update gev_rmf_giornaliero_new
  set
   [Retailer Status] = 'I'
  ,[Sales allowed] = 'N'
  WHERE Company IN ('LTMP','ESSO','RISTOP','MOTOSPA','FINI','BLOCKB','PTSHOP','COOP','STANDA','EPOSG','SC910','SC911','SC912')
  and [Retailer Number] in (
      select dbo.f_gev_codifica_ltm_sgi(lsrpvo_key_id_ricev)
      from anaconda.dbo.lsrpvo
      where lsrpvo_data_inizio between 
      convert(varchar(8),getdate()-5,112)
      and
      convert(varchar(8),getdate(),112)
  )
 -- and [Retailer Number] in (
 --  select dbo.f_gev_codifica_ltm_sgi(lsrpvo_key_id_ricev) sgi
 --  from lsrpvo
 --  where lsrpvo_data_inizio = convert(char(8),getdate(),112)
 --  and lsrpvo_key_id_ricev like 'A%'
 -- )
 
 -- il primo invio della catena A% verso itgs
 -- DEVE essere 'Inactive' e SALES ALLOWED NO
 -- TSR blank
 -- in quanto gestito al rientro da TOTOBIT
GO
