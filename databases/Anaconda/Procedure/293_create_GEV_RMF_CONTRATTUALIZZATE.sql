/****** Object:  StoredProcedure [dbo].[GEV_RMF_CONTRATTUALIZZATE]    Script Date: 11/17/2025 15:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
--IL CRITERIO DEVE ESSERE CHE IL RET_STATUS E'  
--I SE IL PUNTO VENDITA NON E' STATO MAI ATTIVATO
--A ALTRIMENTI.......................
-- *************************************************************************************************
-- pourpose: La procedura [DBO].[GEV_RMF_DETTAGLIO_NEW] aggiorna la tabella 
-- GEV_RMF_DETTAGLIO_NEW presente sul db Condiviso
-- La tabella contiene i dati che serviranno per creare il Retail Master File
-- con le ricevitorie contrattualizzate da inviare a SGI
-- input:    CONDIVISO.DBO.LSR01A
--    CONDIVISO.DBO.LSR01A_IERI
--       CONDIVISO.DBO.LST02A
--       CONDIVISO.DBO.LST02A_IERI
--          CONDIVISO.DBO.LCR01A
--    RISCOSSIONI.dbo.DELEGHEBANCA_PV
--    GEV_Decod_LTM_SGI
--    RMF_20040330_NORMALIZZATO
--    LSRPVO
-- output:   DBO.GEV_RMF_DETTAGLIO_NEW
-- author:  LUCIANO CARRIERO
-- date:     10/05/2004
-- *************************************************************************************************
CREATE  PROCEDURE [dbo].[GEV_RMF_CONTRATTUALIZZATE] 
AS
 
-- inserisco in RMF normalizzato le mancanti
-- che sono entrate in lsrpvo
insert into RMF_20040330_NORMALIZZATO
select lsr01a_key_id_ricev
  ,lsr01a_comune_ricev
  ,lsr01a_cap
  ,lsr01a_prov_ricev
  ,lsr01a_indirizzo
  ,lsr01a_tel_ricevitoria
from  [sql-dbsan1\a].condiviso.dbo.lsr01a a
where  lsr01a_key_id_ricev in (
 select distinct lsrpvo_key_id_ricev 
 from lsrpvo
) and not exists (
 select * 
 from RMF_20040330_NORMALIZZATO xa 
 where xa.codricev = a.lsr01a_key_id_ricev
)
 
DECLARE @OGGI CHAR(8),
  @IERI CHAR(8),
  @DATA_IN_NUOVO_INVIO_SGI CHAR(8)
--E' la data dalla quale devo partire
--per la selezione di pv da inviare a SGI

SELECT @OGGI = CONVERT(VARCHAR, GETDATE(),112)
SELECT @IERI = CONVERT(VARCHAR, GETDATE()-1,112)
SELECT @DATA_IN_NUOVO_INVIO_SGI = CONVERT(VARCHAR, CONVERT(datetime, @OGGI,103)-6,112)

SELECT *
INTO #RID
FROM [SQL-DBSAN1\A].CONDIVISO.DBO.LCR01A
WHERE lcr01a_key_data_fine_val='99999999'
and lcr01a_tipo_gioco='09' 

--** FINE CREAZIONE TABELLA #RID
--** SELEZIONO LE RICEVITORIE CONTRATTUALIZZATE MA NON ATTIVATE AL G&V 
 
BEGIN TRANSACTION

SELECT  TUTTO.*,
  TIPOPAG = CASE WHEN LCR01A_KEY_ID_RICEV IS NULL THEN 'C' ELSE 'E' END,
  BANCA = CASE WHEN LCR01A_KEY_ID_RICEV IS NULL THEN REPLICATE(' ', 30) ELSE LEFT(LCR01A_DESCRIZIONE + REPLICATE(' ', 30),30) END
INTO ##TMP1
FROM
(
 SELECT 
--     CODSGI=Rete_SGI+Right(COD_LOTT,4)
     CODSGI = dbo.f_gev_codifica_ltm_sgi(COD_LOTT)
   , RICERCA_RID
   , COMPANY = KEY_DESC
   , RETE.*
 FROM
 (
  SELECT  
--  COMPANY=  CASE WHEN LEFT(LSR01A_KEY_ID_RICEV,1)='0' OR
--          LEFT(LSR01A_KEY_ID_RICEV,1)='1' OR
--          LEFT(LSR01A_KEY_ID_RICEV,1)='2' OR
--          LEFT(LSR01A_KEY_ID_RICEV,1)='3' OR
--               LEFT(LSR01A_KEY_ID_RICEV,1)='4' THEN 'CONI'
--         ELSE 'LTM' END,
  COD_LOTT=  LSR01A_KEY_ID_RICEV, 
  DENOMINAZIONE=  LEFT(LSR01A_DECOD_RICEV,30), 
  INDIRIZZO=  LEFT(NORMA.INDIRIZZO,50), 
  COMUNE=   NORMA.COMUNE,
  CAP=   NORMA.CAP, 
  PROVINCIA=  NORMA.PROV, 
  --TEL_RICEV=  LEFT(REPLACE(LSR01A_TEL_RICEVITORIA,'/',''),12),
  TEL_RICEV = dbo.f_gev_calcola_telefono(LSR01A_TEL_RICEVITORIA),
  ASSOCIAZIONE=  LSR01A_ASSOCIAZIONE, 
  N_TERM=   LSR01A_TERM_INST,
  OPERATORE = lsrpvo_operatore,
  GG_CONTATTO = lsrpvo_gg_contatto,
  SALES_ALLOWED=CASE  WHEN LSR01A_TAB_GIOCHI_09='1' THEN 'Y' ELSE 'N' END,
  FREQUENZA = dbo.f_gev_calcola_frequenza( null, lsrpvo_classe, lsrpvo_operatore)
 
  FROM  CONDIVISO.DBO.LSR01A, 
    (
     SELECT *
     FROM RMF_20040330_NORMALIZZATO
    )NORMA,
    (
    -- seleziono tutte le ricevitorie contrattualizzate nella settimana
     SELECT *
     FROM lsrpvo 
     WHERE (lsrpvo_data_inizio between @DATA_IN_NUOVO_INVIO_SGI and @OGGI)
     --AND lsrpvo_data_invio_SGI is null
     /*
     SELECT *
     FROM lsrpvo 
     WHERE (lsrpvo_data_inizio between @DATA_IN_NUOVO_INVIO_SGI and @OGGI)
     AND lsrpvo_data_invio_SGI >= lsrpvo_data_inizio
     */
    )CONTRATTI
    --GEV_DECOD_LTM_SGI
  WHERE  LSR01A_KEY_ID_RICEV=codricev
   AND LSR01A_KEY_ID_RICEV=lsrpvo_key_id_ricev
   AND 
   (
    (
    --mai attivate
    lsr01a_tab_giochi_09='0' 
    --attivate mai inviate (attivate oggi)
    OR (lsr01a_tab_giochi_09<>'0' AND lsrpvo_data_invio_SGI is null)
    )
   )
 )RETE,GEV_Decod_LTM_SGI
 WHERE  left(COD_LOTT,2)=Rete_LTM
 -- non vengono inviate le catene gestite da TOTOBIT 
 and Key_Desc not in ('DEADIS' ,'POSM' ,'TOTOBIT' ,'AUTOGRILL')
)TUTTO LEFT OUTER JOIN #RID
ON COD_LOTT = LCR01A_KEY_ID_RICEV
--AND LCR01A_TIPO_GIOCO = RICERCA_RID
ORDER BY TUTTO.COD_LOTT
 
IF @@ERROR <> 0 
BEGIN
 ROLLBACK TRANSACTION
 RETURN
END
 
--** SELEZIONO LE RICEVITORIE ATTIVATE AL G&V NEL PERIODO
--** MA NON CONTRATTUALIZZATE
SELECT --TUTTO.*,
 CODSGI,
 RICERCA_RID,
 COMPANY,
 COD_LOTT, 
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
 SALES_ALLOWED,
 FREQUENZA,
 TIPOPAG=CASE WHEN LCR01A_KEY_ID_RICEV IS NULL THEN 'C' ELSE 'E' END,
 BANCA=CASE WHEN LCR01A_KEY_ID_RICEV IS NULL THEN REPLICATE(' ', 30) 
      ELSE LEFT(LCR01A_DESCRIZIONE + REPLICATE(' ', 30),30) END,
 POSTAZIONE='0', 
 TIPOTERM='8',
/* 
   ELIMINATI TIPOAZIONE E CAUSALE PERCHE'
   IN QUESTA PROCEDURA NON SI ACCEDE A LSRMAT_GEV
*/
--TIPOAZIONE='3', -- serve solo per avere gli stessi campi della ##TMP2
--CAUSALE='3', -- serve solo per avere gli stessi campi della ##TMP2
 RET_STATUS='A', 
 RET_ACTION='U', 
 TERM_STATUS='A', 
 TERM_ACTION='N'
INTO ##TMP3
FROM
(
 SELECT 
--    CODSGI = Rete_SGI+Right(COD_LOTT,4)
    CODSGI = dbo.f_gev_codifica_ltm_sgi(COD_LOTT)
   ,RICERCA_RID
   ,COMPANY = KEY_DESC
   ,RETE.*
 FROM
 (
  SELECT  
--  COMPANY = CASE WHEN LEFT(LSR01A_KEY_ID_RICEV,1)='0' OR
--       LEFT(LSR01A_KEY_ID_RICEV,1)='1' OR
--       LEFT(LSR01A_KEY_ID_RICEV,1)='2' OR
--       LEFT(LSR01A_KEY_ID_RICEV,1)='3' OR
--           LEFT(LSR01A_KEY_ID_RICEV,1)='4' THEN 'CONI'
--        ELSE 'LTM' END,
  COD_LOTT=  LSR01A_KEY_ID_RICEV, 
  DENOMINAZIONE=  LEFT(LSR01A_DECOD_RICEV,30), 
  INDIRIZZO=  LEFT(NORMA.INDIRIZZO,50), 
  --COMUNE=   LEFT(LSR01A_COMUNE_RICEV,25), 
  COMUNE=   NORMA.COMUNE,
  CAP=   NORMA.CAP, 
  PROVINCIA=  NORMA.PROV, 
  --TEL_RICEV=  LEFT(REPLACE(LSR01A_TEL_RICEVITORIA,'/',''),12),
  TEL_RICEV = dbo.f_gev_calcola_telefono(LSR01A_TEL_RICEVITORIA),
  ASSOCIAZIONE=  LSR01A_ASSOCIAZIONE, 
  N_TERM=   LSR01A_TERM_INST,
  OPERATORE = lsrpvo_operatore,
  GG_CONTATTO = lsrpvo_gg_contatto,
  SALES_ALLOWED=CASE  WHEN LSR01A_TAB_GIOCHI_09='1' THEN 'Y' ELSE 'N' END,
 FREQUENZA = dbo.f_gev_calcola_frequenza( null, lsrpvo_classe, lsrpvo_operatore)
  FROM  CONDIVISO.DBO.LSR01A, 
    (
     SELECT *
     FROM RMF_20040330_NORMALIZZATO
    )NORMA,
    (
     -- seleziono tutte le ricevitorie contrattualizzate nella settimana
     -- oppure tutte quelle non contrattualizzate ma attivate
     SELECT *
     FROM lsrpvo 
     WHERE lsrpvo_data_invio_SGI between @DATA_IN_NUOVO_INVIO_SGI and @IERI
     AND lsrpvo_data_invio_SGI is not null
     /*
     SELECT *
     FROM lsrpvo 
     WHERE (lsrpvo_data_invio_SGI < lsrpvo_data_inizio 
     AND lsrpvo_data_inizio between @DATA_IN_NUOVO_INVIO_SGI and @OGGI)
     OR (lsrpvo_data_inizio='00000000' and lsrpvo_data_invio_SGI is Null)
     */     
    )CONTRATTI
    --GEV_DECOD_LTM_SGI
  WHERE  LSR01A_KEY_ID_RICEV=codricev
   AND LSR01A_KEY_ID_RICEV=lsrpvo_key_id_ricev
   AND lsr01a_tab_giochi_09<>'0'
 )RETE,GEV_Decod_LTM_SGI
 WHERE  left(COD_LOTT,2)=Rete_LTM
 -- non vengono inviate le catene gestite da TOTOBIT 
 and Key_Desc not in ( 'DEADIS' ,'POSM' ,'TOTOBIT' ,'AUTOGRILL')
)TUTTO LEFT OUTER JOIN #RID
ON COD_LOTT = LCR01A_KEY_ID_RICEV
--AND LCR01A_TIPO_GIOCO = RICERCA_RID
ORDER BY TUTTO.COD_LOTT
 
IF @@ERROR <> 0 
BEGIN
 ROLLBACK TRANSACTION
 RETURN
END
 
DROP TABLE #RID
 
--Associo alle ricevitorie non EX-TWIN il terminale
SELECT *
INTO ##TMP2
FROM
(
 SELECT --42899
 R.*,
 POSTAZIONE=LST02A_TERMINALE,
 TIPOTERM,
/* AGGIUNTA AZIONI NON DA TABELLA LSRMAT_GEV*/
 RET_STATUS='I',
 RET_ACTION=CASE WHEN LST02A_TERMINALE>'1' THEN 'N' 
        ELSE 'A' -- LST02A_TERMINALE='1' OPPURE NULLO
     END,
 TERM_STATUS='A',
 TERM_ACTION='A'
/* TIPOAZIONE=CASE WHEN LST02A_TERMINALE>'1' THEN 2 
        ELSE 1 -- LST02A_TERMINALE='1' OPPURE NULLO
     END
*/ 
 FROM 
 ##TMP1 R,
 (
  SELECT  
  LST02A_RICEVITORIA,
  LST02A_TERMINALE,
  TIPOTERM = CASE SUBSTRING(LST02A_MATRICOLA,1,1) 
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
 --** Aggiunta TWIN
 AND COD_LOTT NOT LIKE '%X%'
)RETE_TERMINALI--,
 
/*(
 SELECT  LSRMAT_GEV_KEY_ID_CAUSALE,
   RET_STATUS=LSRMAT_GEV_RET_STATUS,
   RET_ACTION=LSRMAT_GEV_RET_ACTION,
   TERM_STATUS=LSRMAT_GEV_TERM_STATUS,
   TERM_ACTION=LSRMAT_GEV_TERM_ACTION
 FROM LSRMAT_GEV
)AZIONI
WHERE TIPOAZIONE=LSRMAT_GEV_KEY_ID_CAUSALE
*/
 
--Associo alle ricevitorie EX-TWIN il terminale 1
 
INSERT INTO ##TMP2
SELECT --42899
 R.*,
 POSTAZIONE='1',
 TIPOTERM='8',
/* AGGIUNTA AZIONI NON DA TABELLA LSRMAT_GEV*/
 RET_STATUS='I',
 RET_ACTION='A',
 TERM_STATUS='A',
 TERM_ACTION='A'
/* TIPOAZIONE=CASE WHEN LST02A_TERMINALE>'1' THEN 2 
        ELSE 1 -- LST02A_TERMINALE='1' OPPURE NULLO
     END
*/ 
 FROM 
 ##TMP1 R
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
 
IF @@ERROR <> 0 
BEGIN
 ROLLBACK TRANSACTION
 RETURN
END
 
DROP TABLE ##TMP1
 
DELETE FROM GEV_RMF_DETTAGLIO_NEW
 
INSERT INTO [ANACONDA].[DBO].[GEV_RMF_DETTAGLIO_NEW]
SELECT
 COMPANY, 
 CODSGI, 
 POSTAZIONE = 
 CASE WHEN RTRIM(LTRIM(CONVERT(CHAR,POSTAZIONE))) = 'A' THEN '10'
   WHEN RTRIM(LTRIM(CONVERT(CHAR,POSTAZIONE))) = 'B' THEN '11'
   WHEN RTRIM(LTRIM(CONVERT(CHAR,POSTAZIONE))) = 'C' THEN '12'
   WHEN RTRIM(LTRIM(CONVERT(CHAR,POSTAZIONE))) = 'D' THEN '13'
   WHEN RTRIM(LTRIM(CONVERT(CHAR,POSTAZIONE))) = 'E' THEN '14'
   ELSE '0' + RTRIM(LTRIM(CONVERT(CHAR,POSTAZIONE))) END, 
 --CODSGIEXT = SUBSTRING(CODSGI,1,1) + LTRIM(COD_LOTT), 
 CODSGIEXT = dbo.f_gev_codifica_ltm_sgi_ext(COD_LOTT), 
 RET_STATUS, 
 RET_ACTION, 
 TERM_STATUS, 
 TERM_ACTION,
 NewRetailerNumber = '       ', 
 NewExternalRetailer = '          ', 
 TIPOTERM, 
 DENOMINAZIONE, 
 INDIRIZZO, 
 COMUNE, 
 CAP, 
 --TEL_RICEV = case when TEL_RICEV is null or LTRIM(TEL_RICEV) = '' then '000000000000' else TEL_RICEV end,
 TEL_RICEV,
 OPERATORE, 
 DSR_NO = '999999999', 
 --GG_CONTATTO,
 case when GG_CONTATTO is null or LTRIM(RTRIM(GG_CONTATTO))='' then '1' else GG_CONTATTO end, 
 FREQUENZA, 
 DENOMINAZIONE as den2, 
 WarehouseNo = '03', 
 SALES_ALLOWED,
 TIPOPAG, 
 BANCA, 
 IndustryCode = dbo.f_gev_calcola_merceologica(COD_LOTT), 
-- IndustryCode = RIGHT('0000' + RTRIM(LTRIM(ASSOCIAZIONE)),4), 
 CommercialNetwork = SUBSTRING(CODSGI,1,1), 
 RetailerType = '1', 
 ChainHeadNumber = '0000000', 
 Province = LEFT(PROVINCIA+SPACE(20),20),
 Comment =   dbo.f_gev_calcola_commento(COMPANY,COD_LOTT) 
  --SPACE(40) 
FROM ( 
 SELECT * FROM ##TMP2
 UNION
 SELECT * FROM ##TMP3
)TUTTE
 

-- le ricevitorie per TOTOBIT devono avere dei valori FISSI, 
-- che poi al ritorno da Totobit vengono cambiati
UPDATE dbo.GEV_RMF_DETTAGLIO_NEW
SET  [Retailer Status] = 'I'
    ,[Sales allowed] = 'N'
    ,[Terminal Number] = '01'
    ,[Terminal Type] = '1'
WHERE Company IN ('LTMP','ESSO','RISTOP','MOTOSPA','FINI','BLOCKB','PTSHOP','COOP','STANDA','EPOSG','SC910','SC911','SC912')
-- le ricevitorie per TOTOBIT devono avere dei valori FISSI, 
-- che poi al ritorno da Totobit vengono cambiati
 
IF @@ERROR <> 0 
BEGIN
 ROLLBACK TRANSACTION
 RETURN
END
 
DROP TABLE ##TMP2
DROP TABLE ##TMP3
 
COMMIT TRANSACTION
GO
