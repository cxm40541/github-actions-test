/****** Object:  StoredProcedure [dbo].[GEV_RMF_GIORNALIERO]    Script Date: 11/17/2025 15:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GEV_RMF_GIORNALIERO]
AS
---------------------------------------------------------------------------------------
-- tabella di appoggio movimentazioni giornaliere
---------------------------------------------------------------------------------------
--drop table #tmp_mov
create table #tmp_mov (
      catena varchar(20),
      codlot varchar(6),
      codsgi varchar(7),
      codsgiext varchar(7),

      tipo_mov varchar(2),
      terminale varchar(1),
      tipo_term varchar(1),

      ret_st char(1),
      ret_act char(1),
      ter_st char(1),
      ter_act char(1),

      azione varchar(4),

      sales varchar(4),
      
      tsr varchar(3),
      classe varchar(1),
      frequenza varchar(2),
      call_day varchar(1)
)

---------------------------------------------------------------------------------------
-- inserimento in tabella indirizzo normalizzato records mancanti
---------------------------------------------------------------------------------------
insert into RMF_20040330_NORMALIZZATO
select lsr01a_key_id_ricev
  ,lsr01a_comune_ricev
  ,lsr01a_cap
  ,lsr01a_prov_ricev
  ,lsr01a_indirizzo
  ,dbo.f_gev_calcola_telefono(lsr01a_tel_ricevitoria)
from  [sql-dbsan1\a].condiviso.dbo.lsr01a a
where  lsr01a_key_id_ricev in (
      SELECT lsrpvo_key_id_ricev
      FROM lsrpvo 
      join gev_decod_ltm_sgi
      on (left(lsrpvo_key_id_ricev,2) = rete_ltm)
      where Key_Desc not in ('AUTOGRILL')
)
and not exists (
 select * 
 from RMF_20040330_NORMALIZZATO xa 
 where xa.codricev = a.lsr01a_key_id_ricev
)

---------------------------------------------------------------------------------------
-- inserimento in tabella lsrpvo record mancanti (a zero)
-- 20080208: aggiunta selezione catene di Aureli

-- 20100908: CDS - aggiunta catena SC915 nella select sotto

---------------------------------------------------------------------------------------
insert into lsrpvo
select lsrser_gev_key_id_ricev
        ,'00000000'
        ,'B'
        ,case when key_desc in ('ESSO','RISTOP','MOTOSPA','FINI','BLOCKB','PTSHOP','COOP','STANDA','SC910','SC911','SC915') 
              then 'AA_'
			  else case when right(lsrser_gev_key_id_ricev,1)%2 = 0 then 'W02' else 'W01' end
			  end
        ,1
        ,'NO'
        ,'00000000'
        ,'00000000'
from  lsrser_gev a 
join gev_decod_ltm_sgi on (left(lsrser_gev_key_id_ricev,2) = rete_ltm)
where Key_Desc not in ('AUTOGRILL')
and   lsrser_gev_flag_validita = 'Y'
and   lsrser_gev_data_decor = (
        select max(lsrser_gev_data_decor)
        from   lsrser_gev xa
        where  lsrser_gev_flag_validita = 'Y'
        and    xa.lsrser_gev_key_id_ricev = a.lsrser_gev_key_id_ricev
)
and not exists (
    select * 
    from   lsrpvo xa 
    where  xa.lsrpvo_key_id_ricev = a.lsrser_gev_key_id_ricev
)

---------------------------------------------------------------------------------------
-- aggiornamento TSR dopo cambio di intestazione
---------------------------------------------------------------------------------------
DECLARE @OGGI  CHAR(8)
SELECT @OGGI = CONVERT(VARCHAR, GETDATE(),112)
exec GEV_AGGIORNA_OPERATORE_DOPO_CI @oggi

---------------------------------------------------------------------------------------
-- aggiornamento TSR catene dei Grandi Clienti (AA_)
-- 20080208: aggiunta update catene di Aureli

-- 20100908: CDS - aggiunta catena SC915 nella query sotto

---------------------------------------------------------------------------------------
update  lsrpvo 
set     lsrpvo_operatore = 'AA_'
--select *
from    lsrpvo a, gev_decod_ltm_sgi deco
where   rete_ltm = substring(lsrpvo_key_id_ricev,1,2) 
and     key_desc in ('ESSO','RISTOP','MOTOSPA','FINI','BLOCKB','PTSHOP','COOP','STANDA','SC910','SC911','SC915' )
and     lsrpvo_operatore <> 'AA_'

---------------------------------------------------------------------------------------
-- aggiornamento TSR catene con operatore a blank (non devono esistere)

-- 20100908: CDS - aggiunta catena SC915 nella query sotto
---------------------------------------------------------------------------------------
update  lsrpvo 
set     lsrpvo_operatore = case when right(lsrpvo_key_id_ricev,1)%2 = 0 then 'W02' else 'W01' end
--select *, lsrpvo_operatore = case when right(lsrpvo_key_id_ricev,1)%2 = 0 then 'W02' else 'W01' end
from    lsrpvo a, gev_decod_ltm_sgi deco
where   rete_ltm = substring(lsrpvo_key_id_ricev,1,2) 
and     key_desc not in ('ESSO','RISTOP','MOTOSPA','FINI','BLOCKB','PTSHOP','COOP','STANDA','SC910','SC911','SC915','AUTOGRILL','LIT')
and     rtrim(ltrim(lsrpvo_operatore)) = ''

---------------------------------------------------------------------------------------
-- CAMBIAMENTI DI STATO (ieri <> oggi) (A,D,R)
---------------------------------------------------------------------------------------
--DECLARE @OGGI  CHAR(8)
--SELECT @OGGI = CONVERT(VARCHAR, GETDATE(),112)
insert into #tmp_mov (codlot,tipo_mov)
select codlot = OGGI.LSR01A_KEY_ID_RICEV, 
   case when ieri.lsr01a_tab_giochi_09 + '' + oggi.lsr01a_tab_giochi_09 = '01' then 'A'
        when ieri.lsr01a_tab_giochi_09 + '' + oggi.lsr01a_tab_giochi_09 = '12' then 'D'
        when ieri.lsr01a_tab_giochi_09 + '' + oggi.lsr01a_tab_giochi_09 = '21' then 'R'
        else '?' end as tipo_mov
FROM CONDIVISO.DBO.LSR01A_IERI IERI, 
     CONDIVISO.DBO.LSR01A OGGI,    (
      SELECT *
      FROM lsrpvo 
    join gev_decod_ltm_sgi
    on (left(lsrpvo_key_id_ricev,2) = rete_ltm)
    where Key_Desc not in ('AUTOGRILL')
) CONTRATTI
WHERE IERI.LSR01A_KEY_ID_RICEV = OGGI.LSR01A_KEY_ID_RICEV
AND OGGI.LSR01A_KEY_ID_RICEV   = lsrpvo_key_id_ricev
AND IERI.LSR01A_TAB_GIOCHI_09 <> OGGI.LSR01A_TAB_GIOCHI_09
and not exists (
      select * 
      from #tmp_mov xa
      where xa.codlot = OGGI.LSR01A_KEY_ID_RICEV
)
---------------------------------------------------------------------------------------
-- MODIFICHE ANAGRAFICHE (provvedimenti di errore o cambi di titolarita')
-- solo sui records ATTIVI (ieri ed oggi = 1) (U)
-- 20080108: aggiunti indirizzo e comune
---------------------------------------------------------------------------------------
--DECLARE @OGGI  CHAR(8)
--SELECT @OGGI = CONVERT(VARCHAR, GETDATE(),112)
insert into #tmp_mov (codlot,tipo_mov)
select codlot = OGGI.LSR01A_KEY_ID_RICEV, 
   case when ieri.lsr01a_tab_giochi_09 + '' + oggi.lsr01a_tab_giochi_09 = '11' then 'UA'
        when ieri.lsr01a_tab_giochi_09 + '' + oggi.lsr01a_tab_giochi_09 = '22' then 'UD'

        else '?' end as tipo_mov
/*
, IERI.LSR01A_INDIRIZZO , OGGI.LSR01A_INDIRIZZO
, IERI.LSR01A_CAP , OGGI.LSR01A_CAP 
, IERI.LSR01A_PROV_RICEV , OGGI.LSR01A_PROV_RICEV 
, IERI.LSR01A_TEL_RICEVITORIA , OGGI.LSR01A_TEL_RICEVITORIA
, IERI.LSR01A_COMUNE_RICEV , OGGI.LSR01A_COMUNE_RICEV
*/

from CONDIVISO.DBO.LSR01A_IERI IERI, 
     CONDIVISO.DBO.LSR01A OGGI, (
      select *
      from lsrpvo join gev_decod_ltm_sgi
      on (left(lsrpvo_key_id_ricev,2) = rete_ltm)
      where key_desc not in ('AUTOGRILL')
) CONTRATTI
WHERE IERI.LSR01A_KEY_ID_RICEV = OGGI.LSR01A_KEY_ID_RICEV
AND   OGGI.LSR01A_KEY_ID_RICEV = lsrpvo_key_id_ricev
AND  (IERI.LSR01A_INDIRIZZO <> OGGI.LSR01A_INDIRIZZO
   OR IERI.LSR01A_CAP <> OGGI.LSR01A_CAP 
   OR IERI.LSR01A_PROV_RICEV <> OGGI.LSR01A_PROV_RICEV 
   OR IERI.LSR01A_TEL_RICEVITORIA <> OGGI.LSR01A_TEL_RICEVITORIA
   OR IERI.LSR01A_COMUNE_RICEV <> OGGI.LSR01A_COMUNE_RICEV)
AND OGGI.LSR01A_TAB_GIOCHI_09 > '0'
AND IERI.LSR01A_TAB_GIOCHI_09 > '0'
AND OGGI.LSR01A_TAB_GIOCHI_09 = IERI.LSR01A_TAB_GIOCHI_09
and not exists (
      select * 
      from #tmp_mov xa
      where xa.codlot = oggi.lsr01a_key_id_ricev
)

------------------------------------------------------------------------------
-- AGGIORNAMENTO tabella NORMALIZZAZIONE per i cambi non presenti nella stessa
------------------------------------------------------------------------------
update rmf_20040330_normalizzato
set
--select codricev,
       comune    = upper(rtrim(ltrim(b.lsr01a_comune_ricev)))
      ,cap       = upper(rtrim(ltrim(b.lsr01a_cap)))
      ,indirizzo = upper(rtrim(ltrim(b.lsr01a_indirizzo)))
      ,prov      = upper(rtrim(ltrim(b.lsr01a_prov_ricev)))
      ,tel_ricev = dbo.f_gev_calcola_telefono(b.lsr01a_tel_ricevitoria)

--, a.comune
--, a.cap
--, a.indirizzo
--, a.prov
--, a.tel_ricev

from dbo.rmf_20040330_normalizzato a
inner join [sql-dbsan1\a].condiviso.dbo.lsr01a b 
on (upper(a.codricev) = upper(b.lsr01a_key_id_ricev))
where (
     upper(rtrim(ltrim(isnull(a.comune,''))))    <> upper(rtrim(ltrim(isnull(b.lsr01a_comune_ricev,'')))) 
or   upper(rtrim(ltrim(isnull(a.cap,''))))       <> upper(rtrim(ltrim(isnull(b.lsr01a_cap,''))))
or   upper(rtrim(ltrim(isnull(a.indirizzo,'')))) <> upper(rtrim(ltrim(isnull(b.lsr01a_indirizzo,''))))
or   upper(rtrim(ltrim(isnull(a.prov,''))))      <> upper(rtrim(ltrim(isnull(b.lsr01a_prov_ricev,''))))
or   upper(rtrim(ltrim(isnull(dbo.f_gev_calcola_telefono(a.tel_ricev),'')))) <> upper(rtrim(ltrim(isnull(dbo.f_gev_calcola_telefono(b.lsr01a_tel_ricevitoria),''))))
)
--and lsr01a_key_id_ricev in (
--      select codlot 
--      from #tmp_mov xa
--)

---------------------------------------------------------------------------------------
-- RESCISSIONE CONTRATTUALE:
-- invio primo terminale e ricevitoria come IUID (tutte le ricevitorie)
-- successivi terminali come INID (solo ltm e coni)
---------------------------------------------------------------------------------------
DECLARE @IERI CHAR(8)
SELECT @IERI = CONVERT(VARCHAR, GETDATE()-1,112)
--DECLARE @OGGI  CHAR(8)
--SELECT @OGGI = CONVERT(VARCHAR, GETDATE(),112)

--drop table #tmp_rescissione
create table #tmp_rescissione (
	codlot varchar(6)
)

insert into #tmp_rescissione
select lsrlet_key_id_ricev
from   lsrlet a 
join   gev_decod_ltm_sgi b on (left(a.lsrlet_key_id_ricev,2) = b.rete_ltm)
where  lsrlet_key_data_ins = @ieri
and    lsrlet_decor_dal = @oggi
and    lsrlet_cod_servizio = '09'
and    lsrlet_tipo_movimentazione = 'D'
and    b.key_desc not in ('AUTOGRILL')
and exists (
	select * 
	from   lsrrad_gev xa
	where  xa.lsrrad_cod_lotto = a.lsrlet_key_id_ricev
	and    xa.lsrrad_key_data_ins + xa.lsrrad_key_ora_ins = a.lsrlet_fk_tab_documento
	and    xa.lsrrad_causale = 'RESCISSIONE CONTRATTUALE'
)
union
select lsrrad_cod_lotto 
from lsrrad_gev, lsrser_gev a
join gev_decod_ltm_sgi b on (left(a.lsrser_gev_key_id_ricev,2) = b.rete_ltm)
where lsrrad_key_data_ins = @ieri
and lsrrad_causale = 'RESCISSIONE CONTRATTUALE'
and lsrrad_tipo_movimentazione = 'D'
and lsrser_gev_key_id_ricev = lsrrad_cod_lotto
and lsrser_gev_flag_validita = 'Y'
and lsrser_gev_stato = '2'
and b.key_desc not in ('AUTOGRILL')
and lsrser_gev_data_decor = (
    select max (lsrser_gev_data_decor) 
    from lsrser_gev
    where A.lsrser_gev_key_id_ricev = lsrser_gev_key_id_ricev
    and lsrser_gev_data_decor <= @ieri
    and lsrser_gev_flag_validita = 'Y'
)

delete 
from #tmp_mov 
where codlot in (select distinct codlot from #tmp_rescissione)

-- aggiorno i presenti su #tmp_mov
update #tmp_mov 
set tipo_mov = 'DR'
where codlot in (select distinct codlot from #tmp_rescissione)

-- inserisco i mancanti da #tmp_mov	
insert into #tmp_mov (codlot, tipo_mov, terminale, tipo_term)
select distinct codlot, 'DR', '1', '1' 
from #tmp_rescissione a
where not exists (
	select codlot 
	from #tmp_mov xa 
	where xa.codlot = a.codlot
)

------------------------------------------------------------------------------
-- incremento terminali solo su pdv attivi e LTM
------------------------------------------------------------------------------
--DECLARE @OGGI  CHAR(8)
--SELECT @OGGI = CONVERT(VARCHAR, GETDATE(),112)
insert into #tmp_mov (codlot, tipo_mov, azione, sales, terminale, tipo_term)
SELECT TERM_OGGI.LST02A_RICEVITORIA
      ,'IT' 
      ,'ANAA'
      ,'Y'
      ,TERM_OGGI.LST02A_TERMINALE
      ,CASE SUBSTRING(TERM_OGGI.LST02A_MATRICOLA,1,1)
         WHEN '1' THEN '2'
         WHEN '2' THEN '2'
         WHEN '3' THEN '4'
         WHEN '4' THEN '5'
         WHEN '5' THEN '6'
         ELSE '8' END
FROM 
(
      select *
      from   condiviso.dbo.lst02a 
      where  lst02a_ricevitoria <> '' 
      and    lst02a_stato_term = '1'
      and    lst02a_terminale <> 'T'
) TERM_OGGI
left outer join 
(
      select *
      from   condiviso.dbo.lst02a_ieri
      where  lst02a_ricevitoria <> '' 
      and    lst02a_stato_term = '1'
      and    lst02a_terminale <> 'T'
) TERM_IERI
on (TERM_OGGI.lst02a_ricevitoria + TERM_OGGI.lst02a_terminale = 
    TERM_IERI.lst02a_ricevitoria + TERM_IERI.lst02a_terminale)
inner join condiviso.dbo.lsr01a LSR
on   (TERM_OGGI.lst02a_ricevitoria = LSR.lsr01a_key_id_ricev)
where TERM_IERI.lst02a_ricevitoria + TERM_IERI.lst02a_terminale is null
and LSR.lsr01a_tab_giochi_09 = '1'
and not exists (
      select * 
      from #tmp_mov xa
      where xa.codlot = TERM_OGGI.LST02A_RICEVITORIA
)

------------------------------------------------------------------------------
-- decremento terminali solo su pdv attivi e LTM
------------------------------------------------------------------------------
--DECLARE @OGGI  CHAR(8)
--SELECT @OGGI = CONVERT(VARCHAR, GETDATE(),112)
insert into #tmp_mov (codlot, tipo_mov, azione, sales, terminale, tipo_term)
SELECT COD_LOTT = TERM_IERI.LST02A_RICEVITORIA
      ,'DT' 
      ,'ANAD'
      ,'Y'
      ,TERM_IERI.LST02A_TERMINALE
      ,CASE SUBSTRING(TERM_IERI.LST02A_MATRICOLA,1,1)
         WHEN '1' THEN '2'
         WHEN '2' THEN '2'
         WHEN '3' THEN '4'
         WHEN '4' THEN '5'
         WHEN '5' THEN '6'
         ELSE '8' END
FROM
(
      select *
      from   condiviso.dbo.lst02a_ieri
      where  lst02a_ricevitoria <> '' 
      and    lst02a_stato_term = '1'
      and    lst02a_terminale <> 'T'
)TERM_IERI left outer join 
(
      select *
      from   condiviso.dbo.lst02a
      where  lst02a_ricevitoria <> '' 
      and    lst02a_stato_term = '1'
      and    lst02a_terminale <> 'T'
)TERM_OGGI
on (TERM_IERI.lst02a_ricevitoria + TERM_IERI.lst02a_terminale = 
    TERM_OGGI.lst02a_ricevitoria + TERM_OGGI.lst02a_terminale)
inner join condiviso.dbo.lsr01a LSR
on   (TERM_OGGI.lst02a_ricevitoria = LSR.lsr01a_key_id_ricev)
where TERM_OGGI.lst02a_ricevitoria + TERM_OGGI.lst02a_terminale is null
and LSR.lsr01a_tab_giochi_09 = '1'
and not exists (
      select * 
      from #tmp_mov xa
      where xa.codlot = TERM_OGGI.LST02A_RICEVITORIA
)


---------------------------------------------------------------------------------------
-- aggiunta terminali > 1 per le ricevitorie LTM e CONI, 
-- solo per RESCISSIONE CONTRATTUALE
---------------------------------------------------------------------------------------
insert into #tmp_mov (catena, codlot, codsgi, codsgiext, tipo_mov, terminale, 
                      tipo_term, azione, sales, tsr,  classe, frequenza, call_day)
select catena, codlot, codsgi, codsgiext, 'TD', b.LST02A_TERMINALE, 
       b.TIPO_TERM, 'INID', sales, tsr, classe, frequenza, call_day
from #tmp_mov a, (
	SELECT LST02A_RICEVITORIA,
		   LST02A_TERMINALE,
	       TIPO_TERM = 
		   CASE SUBSTRING(LST02A_MATRICOLA,1,1) 
			  WHEN '1' THEN '2'
	          WHEN '2' THEN '2'
	          WHEN '3' THEN '4'
	          WHEN '4' THEN '5'
	          WHEN '5' THEN '6'
	       ELSE '8' END
	FROM  CONDIVISO.DBO.LST02A
	WHERE LST02A_STATO_TERM = '1'
	and   LST02A_TERMINALE > '1'
        and   LST02A_TERMINALE <> 'T'
) b
where a.codlot = b.LST02A_RICEVITORIA
and tipo_mov = 'DR' 

---------------------------------------------------------------------------------------
-- aggiunta terminali = 1 per le ricevitorie LTM e CONI, 
-- solo per RESCISSIONE CONTRATTUALE
---------------------------------------------------------------------------------------
update #tmp_mov set tipo_term = b.TIPO_TERM
from #tmp_mov a, (
	SELECT LST02A_RICEVITORIA,
		   LST02A_TERMINALE,
	       TIPO_TERM = 
		   CASE SUBSTRING(LST02A_MATRICOLA,1,1) 
			  WHEN '1' THEN '2'
	          WHEN '2' THEN '2'
	          WHEN '3' THEN '4'
	          WHEN '4' THEN '5'
	          WHEN '5' THEN '6'
	       ELSE '8' END
	FROM CONDIVISO.DBO.LST02A
	WHERE LST02A_STATO_TERM = '1'
	and LST02A_TERMINALE = '1'
	and LST02A_TERMINALE <> 'T'
) b
where a.codlot = b.LST02A_RICEVITORIA
and a.terminale = b.LST02A_TERMINALE
and tipo_mov = 'DR' 

---------------------------------------------------------------------------------------
-- AGGIORNAMENTI CAMPI TABELLA APPOGGIO
---------------------------------------------------------------------------------------
update #tmp_mov 
set  codsgi = isnull(rete_sgi,'') + substring(codlot,3,4)
from #tmp_mov a, gev_decod_ltm_sgi deco
where rete_ltm = substring(codlot,1,2) 

update #tmp_mov 
set  codsgiext = isnull(rete_sgi_ext,'') + substring(codlot,3,4)
from #tmp_mov a, gev_decod_ltm_sgi deco
where rete_ltm = substring(codlot,1,2) 

update #tmp_mov 
set  catena = key_desc
from #tmp_mov a, gev_decod_ltm_sgi deco
where rete_ltm = substring(codlot,1,2) 

update #tmp_mov 
set tsr        = lsrpvo_operatore
   ,call_day   = lsrpvo_gg_contatto 
   ,classe     = lsrpvo_classe
from  #tmp_mov a, lsrpvo b
where a.codlot = b.lsrpvo_key_id_ricev

update #tmp_mov 
set frequenza = dbo.f_gev_calcola_frequenza(left(codsgi,3),classe,tsr)

---------------------------------------------------------------------------------------
-- Cancellazione records relativi a catene per cui l'attivazione (tipo_mov = A) 
-- viene gestita da TOTOBIT
---------------------------------------------------------------------------------------
delete 
from #tmp_mov
where tipo_mov = 'A'
and catena in ('TOTOBIT','DEADIS','POSM','AUTOGRILL')

---------------------------------------------------------------------------------------
-- cancellazione records non utili
---------------------------------------------------------------------------------------
delete 
from #tmp_mov 
where tipo_mov = '?'

---------------------------------------------------------------------------------------
-- aggiornamento azioni da tipo movimentazione 
---------------------------------------------------------------------------------------
-- (A) Attivazione
-- (D) Disattivazione
-- (R) Riattivazione
-- (UA) Update su ricevitoria Attiva
-- (UD) Update su ricevitoria Disattiva
-- (DR) Disattivazione Rescissione
-- (TD) Terminale Delete Rescissione
---------------------------------------------------------------------------------------
update #tmp_mov 
set azione = 'AAAA', sales = 'Y', terminale = '1', tipo_term = '1'
where tipo_mov = 'A'

--select * from #tmp_mov where tipo_mov = 'A'
---------------------------------------------------------------------------------------
-- aggiunta terminali > 1 per le ricevitorie LTM e CONI, solo per ATTIVAZIONE
-- DA CONTROLLARE!!!!
---------------------------------------------------------------------------------------
insert into #tmp_mov (catena, codlot, codsgi, codsgiext, tipo_mov, terminale, 
                      tipo_term, azione, sales, tsr,  classe, frequenza, call_day)
select catena, codlot, codsgi, codsgiext, 'IT', b.LST02A_TERMINALE, 
       b.TIPO_TERM, 'ANAA', sales, tsr, classe, frequenza, call_day
from #tmp_mov a, (
	SELECT LST02A_RICEVITORIA,
	       LST02A_TERMINALE,
	       TIPO_TERM = 
		   CASE SUBSTRING(LST02A_MATRICOLA,1,1) 
			  WHEN '1' THEN '2'
	          WHEN '2' THEN '2'
	          WHEN '3' THEN '4'
	          WHEN '4' THEN '5'
	          WHEN '5' THEN '6'
	       ELSE '8' END
	FROM  CONDIVISO.DBO.LST02A
	WHERE LST02A_STATO_TERM = '1'
	and   LST02A_TERMINALE > '1'
	and   LST02A_TERMINALE <> 'T'
) b
where a.codlot = b.LST02A_RICEVITORIA
and tipo_mov = 'A' 
and catena in ('LTM','CONI')


---------------------------------------------------------------------------------------
-- aggiunta terminali = 1 per le ricevitorie LTM e CONI, solo per ATTIVAZIONE
-- DA CONTROLLARE!!!!
---------------------------------------------------------------------------------------
update #tmp_mov set tipo_term = b.TIPO_TERM
from #tmp_mov a, (
	SELECT LST02A_RICEVITORIA,
		   LST02A_TERMINALE,
	       TIPO_TERM = 
		   CASE SUBSTRING(LST02A_MATRICOLA,1,1) 
			  WHEN '1' THEN '2'
	          WHEN '2' THEN '2'
	          WHEN '3' THEN '4'
	          WHEN '4' THEN '5'
	          WHEN '5' THEN '6'
	       ELSE '8' END
	FROM CONDIVISO.DBO.LST02A
	WHERE LST02A_STATO_TERM = '1'
	and LST02A_TERMINALE = '1'
	and LST02A_TERMINALE <> 'T'
) b
where a.codlot = b.LST02A_RICEVITORIA
and a.terminale = b.LST02A_TERMINALE
and tipo_mov = 'A' 
and catena in ('LTM','CONI')

---------------------------------------------------------------------------------------
-- aggiornamento azioni da tipo movimentazione 
---------------------------------------------------------------------------------------
-- (A) Attivazione
-- (D) Disattivazione
-- (R) Riattivazione
-- (UA) Update su ricevitoria Attiva
-- (UD) Update su ricevitoria Disattiva
-- (DR) Disattivazione Rescissione
-- (TD) Terminale Delete Rescissione
-- (IT) Incremento Terminale
-- (DT) Decremento Terminale
---------------------------------------------------------------------------------------
-- la catena POSGIALLO va mandata IAAA sales N solo per la prima attivazione

-- 20100908: CDS - aggiunta catena SC915 nella query sotto

---------------------------------------------------------------------------------------
update #tmp_mov 
set azione = 'IUAU', sales = 'N', terminale = '1', tipo_term = '1'
where tipo_mov = 'A'
and catena in ('LTMP','ESSO','RISTOP','MOTOSPA','FINI','BLOCKB','PTSHOP',
               'COOP','STANDA','EPOSG','SC910','SC911','SC912','SC913','SC915')

update #tmp_mov 
set azione = 'AUAU', sales = 'N', terminale = '1', tipo_term = '1'
where tipo_mov = 'D'

update #tmp_mov 
set azione = 'AUAU', sales = 'Y', terminale = '1', tipo_term = '1'
where tipo_mov = 'R'

update #tmp_mov 
set azione = 'AUAU', sales = 'Y', terminale = '1', tipo_term = '1'
where tipo_mov = 'UA'

update #tmp_mov 
set azione = 'AUAU', sales = 'N', terminale = '1', tipo_term = '1'
where tipo_mov = 'UD'

-- rescissione contrattuale
update #tmp_mov 
set azione = 'IUIU', sales = 'N', terminale = '1'
where tipo_mov = 'DR'

update #tmp_mov 
set azione = 'IUIU', sales = 'N'
where tipo_mov = 'TD'

---------------------------------------------------------------------------------------
-- split campo azione nei 4 campi per rmf
---------------------------------------------------------------------------------------
update #tmp_mov 
set ret_st  = substring(azione,1,1)
   ,ret_act = substring(azione,2,1)
   ,ter_st  = substring(azione,3,1) 
   ,ter_act = substring(azione,4,1) 

--select * from #tmp_mov order by codlot, terminale
---------------------------------------------------------------------------------------
-- Creazione tabella temporanea RID
---------------------------------------------------------------------------------------
--drop table #rid
SELECT *
INTO #RID
FROM [SQL-DBSAN1\A].CONDIVISO.DBO.LCR01A
WHERE lcr01a_key_data_fine_val='99999999'
and lcr01a_tipo_gioco='09'
and lcr01a_key_id_ricev in (select codlot from #tmp_mov)

---------------------------------------------------------------------------------------
-- Creazione tabella temporanea per invio (1)

-- 20100908: CDS - aggiunta catena SC915 nella query sotto

---------------------------------------------------------------------------------------
--drop table ##tmp__3
select       CODSGI        = codsgi
            ,RICERCA_RID   = '09' 
            ,COMPANY       = catena
            ,COD_LOTT      = codlot
            ,DENOMINAZIONE = LEFT(LSR01A_DECOD_RICEV,30)
            ,INDIRIZZO = case when NORMA.INDIRIZZO is null then  LEFT(LSR01A_INDIRIZZO,50) else LEFT(NORMA.INDIRIZZO,50) end
            ,COMUNE = case when NORMA.COMUNE is null then LSR01A_COMUNE_RICEV else NORMA.COMUNE end
            ,CAP =  case when NORMA.CAP is null then lsr01a_cap else norma.cap end
            ,PROVINCIA = case when NORMA.PROV is null then lsr01a_prov_ricev else NORMA.PROV end
            ,TEL_RICEV = case when (NORMA.TEL_RICEV is null or rtrim(ltrim(NORMA.TEL_RICEV)) = '')
                                     then case when (lsr01a_tel_ricevitoria is null or lsr01a_tel_ricevitoria = '') 
                               then case when (lsr01a_tel_casa is null or lsr01a_tel_casa = '') 
                                                            then dbo.f_gev_calcola_telefono('0000000000')
                                                     else dbo.f_gev_calcola_telefono(lsr01a_tel_casa)
                                    end
                                            else dbo.f_gev_calcola_telefono(lsr01a_tel_ricevitoria)
                                            end
                                     else  dbo.f_gev_calcola_telefono(NORMA.TEL_RICEV)
                              end
            ,ASSOCIAZIONE = LSR01A_ASSOCIAZIONE
            ,N_TERM = LSR01A_TERM_INST
            ,OPERATORE = tsr
            ,GG_CONTATTO = call_day
            ,SALES_ALLOWED = sales
            ,FREQUENZA = frequenza
            ,STATO_GV = case when lsr01a_tab_giochi_09 = '1' then 'A' else 'I' end

            ,case when catena in ('ESSO','RISTOP','MOTOSPA','FINI','BLOCKB','PTSHOP','COOP','STANDA','EPOSG','SC910','SC911','SC912','SC913','SC915','TOTOBIT','DEADIS') 
              then 'E'
              else CASE WHEN lcr01a_key_id_ricev IS NULL THEN 'C' ELSE 'E' END 
         end as tipopag

            ,case when catena in ('ESSO','RISTOP','MOTOSPA','FINI','BLOCKB','PTSHOP','COOP','STANDA','EPOSG','SC910','SC911','SC912','SC913','SC915','TOTOBIT','DEADIS') 
              then LEFT('BANCA INTESA' + REPLICATE(' ', 30),30)
              else CASE WHEN lcr01a_key_id_ricev IS NULL THEN REPLICATE(' ', 30) ELSE LEFT(LCR01A_DESCRIZIONE + REPLICATE(' ', 30),30) END  
         end as banca

            ,POSTAZIONE = terminale
            ,TIPOTERM = tipo_term
            ,RET_STATUS = ret_st
            ,RET_ACTION = ret_act
            ,TERM_STATUS = ter_st
            ,TERM_ACTION = ter_act
            ,CLASSE = classe
            ,codsgiext

into ##tmp__3
from #tmp_mov a
left outer join condiviso.dbo.lsr01a b on (codlot = lsr01a_key_id_ricev)
left outer join #rid c                 on (codlot = lcr01a_key_id_ricev)
left outer join RMF_20040330_NORMALIZZATO norma on (codlot = codricev)
left outer join lsrpvo e               on (codlot = lsrpvo_key_id_ricev)

---------------------------------------------------------------------------------------
-- caricamento records per invio
---------------------------------------------------------------------------------------
DELETE FROM GEV_RMF_GIORNALIERO_NEW
INSERT INTO [ANACONDA].[DBO].[GEV_RMF_GIORNALIERO_NEW]
SELECT  COMPANY,
            CODSGI, 
            a = CASE WHEN RTRIM(LTRIM(CONVERT(CHAR,POSTAZIONE)))='A' THEN '10'
                         WHEN RTRIM(LTRIM(CONVERT(CHAR,POSTAZIONE)))='B' THEN '11'
                         WHEN RTRIM(LTRIM(CONVERT(CHAR,POSTAZIONE)))='C' THEN '12'
                         WHEN RTRIM(LTRIM(CONVERT(CHAR,POSTAZIONE)))='D' THEN '13'
                         WHEN RTRIM(LTRIM(CONVERT(CHAR,POSTAZIONE)))='E' THEN '14'
                         WHEN RTRIM(LTRIM(CONVERT(CHAR,POSTAZIONE)))='F' THEN '15'
                         ELSE '0' + RTRIM(LTRIM(CONVERT(CHAR,POSTAZIONE))) END, 
            CODSGIEXT = codsgiext, 
            RET_STATUS, 
            RET_ACTION, 
            TERM_STATUS, 
            TERM_ACTION,
            b = '       ', 
            c = '          ', 
            TIPOTERM, 
            DENOMINAZIONE, 
            INDIRIZZO, 
            COMUNE, 
            CAP, 
            d = case when TEL_RICEV is null or LTRIM(TEL_RICEV) = '' then '0000000000  ' else TEL_RICEV end,
            OPERATORE = case when OPERATORE is null then '   ' else OPERATORE end, 
            e = '999999999', 
            f = case when GG_CONTATTO is null or LTRIM(GG_CONTATTO) = '' then '1' else GG_CONTATTO end, 
            FREQUENZA, 
            Contact_Name = DENOMINAZIONE, 
            g = '03', 
            SALES_ALLOWED,
            TIPOPAG, 
            BANCA, 
            i = dbo.f_gev_calcola_merceologica(COD_LOTT),
            l = SUBSTRING(CODSGI,1,1), 
            m = '1', 
            n = '0000000', 
            o = LEFT(PROVINCIA+SPACE(20),20), 
            p = dbo.f_gev_calcola_commento(COMPANY, COD_LOTT)
FROM 
(     
      SELECT *
      FROM ##tmp__3
)TUTTE

---------------------------------------------------------------------------------------
-- Creazione tabella tmp_attive_no_contratto per update successiva nel dts
---------------------------------------------------------------------------------------
DELETE FROM tmp_attive_no_contratto
INSERT INTO tmp_attive_no_contratto
SELECT codlot as cod_lott
FROM #tmp_mov
WHERE tipo_mov = 'A'

---------------------------------------------------------------------------------------
-- cancellazione tabelle di appoggio
---------------------------------------------------------------------------------------
DROP TABLE #tmp_mov
DROP TABLE #rid
DROP TABLE ##tmp__3
GO
