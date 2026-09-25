/****** Object:  StoredProcedure [dbo].[INSERT_ANA_MODIFICHE]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--**********************************************************************************************--
--**
--** PROCEDURA PER L'ESTRAZIONE DELLE MODIFICHE ANAGRAFICHE , CAMBI DI INTESTAZIONE  E 
--** NUOVE ATTIVAZIONI RELATIVE ALL'ANAGRAFICA CONI DA INVIARE A LTO0AA E A SAP.
--** LE INFORMAZIONI SARANNO INSERITE ALL'INTERNO DI UNA TABELLA DI ANACONDA
--** DENOMINATA ANA_MODIFICHE.
--** LA PROCEDURA E' LA SEGUENTE: SI ESTRAGGONO TUTTE LE MODIFICHE ANAGRAFICHE RELATIVE
--** AL TITOLARE CONI (ATTENZIONE: A SAP INTERESSA SOLO L'EVENTUALE CAMBIO DEL TEL. CASA DEL
--** TITOLARE). SI ESTRAGGONO, POI, LE CESSAZIONI (SOLO PER LTO0AA), 
--** LE MODIFICHE DI RICEVITORIA (SOLO PER SAP), I CAMBI DI INTESTAZIONE E LE NUOVE INTESTAZIONI.
--** DALLE MODIFICHE ANAGRAFICHE VERRANNO ELIMINATE LE CESSAZIONI E I C.I. PER L'INVIO A LTO0AA E
--** LE MODIFICHE DI RICEVITORIA E I C.I. PER L'INVIO A SAP.
--** IL CAMPO TIPO_MOD DI ANA MODIFICHE VARIERA' NEL SEGUENTE MODO:
--** 
--** M = MODIFICHE ANAGRAFICHE PER LTO0AA (AL NETTO DELLE CESSAZIONI E DEI C.I.)
--** C = CESSAZIONI PER LTO0AA
--** N = MODIFICHE ANAGRAFICHE PER SAP (AL NETTO DELLE MODIFICHE DI RICEVITORIA E DEI C.I.)
--** R = MODIFICHE DI RICEVITORIA PER SAP
--** I = CAMBI INTESTAZIONE E NUOVI TITOLARI PER LTO0AA E SAP
--**
--** (*) NOTA: IL TELEFONO DI RICEVITORIA DA INVIARE SAP VERRA' VALORIZZATO SOLO NELLE 
--**           MODIFICHE ANAGRAFICHE IN QUANTO PER I CAMBI E LE NUOVE INTESTAZIONI
--**           IL DATO SARA' RICAVATO DALLA TABELLA LSR01A
--**********************************************************************************************--

CREATE PROCEDURE [dbo].[INSERT_ANA_MODIFICHE] @DATA CHAR(8)
AS
BEGIN
DECLARE
@DATA_PREC 		CHAR(8)

SELECT @DATA_PREC=convert(char(8),dateadd(dd, -1, convert(datetime, @DATA , 112)),112)
--SELECT @DATA = CONVERT(CHAR(8), GETDATE(), 112)


--*** Mod anag (LTO0AA)
SELECT * , DECOR_DAL = '99999999'--LSRTIT_CONI_KEY_ID_RICEV
INTO ##TMP_MOD_ANA_LTO
FROM LSRTIT_CONI A 
WHERE LSRTIT_CONI_DATA_VALIDITA + LSRTIT_CONI_ORA_VALIDITA = 
	(SELECT MAX(LSRTIT_CONI_DATA_VALIDITA + LSRTIT_CONI_ORA_VALIDITA) FROM LSRTIT_CONI B
	 WHERE ((LSRTIT_CONI_DATA_VALIDITA <= @DATA AND LSRTIT_CONI_KEY_DATA_INS =  @DATA_PREC)
	OR LSRTIT_CONI_DATA_VALIDITA =  @DATA)
AND B.LSRTIT_CONI_KEY_ID_RICEV= A.LSRTIT_CONI_KEY_ID_RICEV
AND LSRTIT_CONI_FLAG_VALIDITA = 'Y'
AND LSRTIT_CONI_FT_VOS = '00000000') 
AND LSRTIT_CONI_FLAG_VALIDITA = 'Y'
AND LSRTIT_CONI_FT_VOS = '00000000'


--*** Mod anag (SAP)
SELECT * 
INTO ##TMP_MOD_ANA_SAP
FROM ##TMP_MOD_ANA_LTO



--*** Cessazioni titolare per LTO0AA
SELECT A.* , DECOR_DAL=lsrpro_coni_decor_dal--LSRTIT_CONI_KEY_ID_RICEV
INTO ##TMP_CESSAZ_LTO
FROM LSRTIT_CONI A , lsrpro_coni C
WHERE LSRTIT_CONI_DATA_VALIDITA + LSRTIT_CONI_ORA_VALIDITA = 
	(SELECT MAX(LSRTIT_CONI_DATA_VALIDITA + LSRTIT_CONI_ORA_VALIDITA) 
	FROM LSRTIT_CONI B
	 WHERE  B.LSRTIT_CONI_KEY_ID_RICEV= A.LSRTIT_CONI_KEY_ID_RICEV
	AND LSRTIT_CONI_FLAG_VALIDITA = 'Y'
	and LSRTIT_CONI_DATA_VALIDITA <= C.LSRPRO_CONI_DECOR_DAL
	) 
AND LSRTIT_CONI_FLAG_VALIDITA = 'Y'
AND lsrpro_coni_KEY_ID_RICEV=LSRTIT_CONI_KEY_ID_RICEV
AND (LSRPRO_CONI_DECOR_DAL = (@DATA)  
	OR (LSRPRO_CONI_DECOR_DAL <= @DATA AND LSRPRO_CONI_KEY_DATA_INS = @DATA_PREC))
	AND lsrpro_coni_tipo_provv IN ('F')
	AND LSRPRO_CONI_FT_VOS = '00000000'
	AND LSRPRO_CONI_FLAG_VALIDITA = 'Y'


--*** Mod di ricevitoria per SAP
SELECT * , DECOR_DAL = '99999999'--LSRTIT_CONI_KEY_ID_RICEV
INTO ##TMP_MOD_RIC_SAP
FROM LSRRIC A 
WHERE LSRRIC_DATA_VALIDITA + LSRRIC_ORA_VALIDITA = 
	(SELECT MAX(LSRRIC_DATA_VALIDITA + LSRRIC_ORA_VALIDITA) FROM LSRRIC B
	 WHERE ((LSRRIC_DATA_VALIDITA <= @DATA AND LSRRIC_KEY_DATA_INS =  @DATA_PREC)
	OR LSRRIC_DATA_VALIDITA =  @DATA)
	AND B.LSRRIC_KEY_ID_RICEV= A.LSRRIC_KEY_ID_RICEV
	AND LSRRIC_FLAG_VALIDITA = 'Y'
	AND LSRRIC_FT_VOS = '00000000') 
	AND LSRRIC_FLAG_VALIDITA = 'Y'
	AND LSRRIC_FT_VOS = '00000000'


--*** Cambi titolare per LTO0AA E SAP
SELECT A.* , DECOR_DAL=lsrpro_coni_decor_dal--LSRTIT_CONI_KEY_ID_RICEV
INTO ##TMP_CAMBI_TIT
FROM LSRTIT_CONI A , lsrpro_coni
WHERE LSRTIT_CONI_DATA_VALIDITA + LSRTIT_CONI_ORA_VALIDITA = 
	(SELECT MAX(LSRTIT_CONI_DATA_VALIDITA + LSRTIT_CONI_ORA_VALIDITA) 
	FROM LSRTIT_CONI B
	WHERE  B.LSRTIT_CONI_KEY_ID_RICEV= A.LSRTIT_CONI_KEY_ID_RICEV
	AND LSRTIT_CONI_FLAG_VALIDITA = 'Y') 
	AND LSRTIT_CONI_FLAG_VALIDITA = 'Y'
	AND lsrpro_coni_KEY_ID_RICEV=LSRTIT_CONI_KEY_ID_RICEV
	AND (LSRPRO_CONI_DECOR_DAL = (@DATA)  
	OR (LSRPRO_CONI_DECOR_DAL <= @DATA AND LSRPRO_CONI_KEY_DATA_INS = @DATA_PREC))
	AND lsrpro_coni_tipo_provv IN ('I')
	AND LSRPRO_CONI_FT_VOS = '00000000'
	AND LSRPRO_CONI_FLAG_VALIDITA = 'Y'



--*** Nuovi titolari
SELECT * --LSRTIT_CONI_KEY_ID_RICEV
INTO ##TMP_NUOVI_TIT
FROM LSRTIT_CONI A 
WHERE LSRTIT_CONI_DATA_VALIDITA + LSRTIT_CONI_ORA_VALIDITA = 
	(SELECT MAX(LSRTIT_CONI_DATA_VALIDITA + LSRTIT_CONI_ORA_VALIDITA) 
	 FROM LSRTIT_CONI B
	 WHERE 	LSRTIT_CONI_DATA_VALIDITA <= @DATA 
	 AND B.LSRTIT_CONI_KEY_ID_RICEV= A.LSRTIT_CONI_KEY_ID_RICEV
	 AND LSRTIT_CONI_FLAG_VALIDITA = 'Y') 
AND LSRTIT_CONI_FLAG_VALIDITA = 'Y'
AND LSRTIT_CONI_KEY_ID_RICEV NOT IN
	(SELECT DISTINCT LTO0AA_KEY_ID_RICEV
	 FROM CONDIVISO.DBO.LTO0AA)


--*** PREPARAZIONE FILE DELLE MODIFICHE ANAGRAFICHE PER LTO0AA:
--*** Elimino dalle modifiche anagrafiche i record che ho già considerato
--*** nelle cessazioni e quelli considerati nei cambi di titolarità
DELETE FROM ##TMP_MOD_ANA_LTO
WHERE LSRTIT_CONI_KEY_ID_RICEV IN 
	(SELECT DISTINCT(LSRTIT_CONI_KEY_ID_RICEV)
	 FROM ##TMP_CESSAZ_LTO)

DELETE FROM ##TMP_MOD_ANA_LTO
WHERE LSRTIT_CONI_KEY_ID_RICEV IN 
	(SELECT DISTINCT(LSRTIT_CONI_KEY_ID_RICEV)
	 FROM ##TMP_CAMBI_TIT)


--*** PREPARAZIONE FILE DELLE MODIFICHE ANAGRAFICHE PER SAP:
--*** Elimino dalle modifiche anagrafiche i record che ho già considerato
--*** nei cambi di titolarità.
--*** Creo un unico dataset mettendo insieme i record delle modifiche
--*** anagrafiche e quelli delle modifiche di ricevitoria
--*** e considerando una sola volta eventuali ricevitorie appartenenti
--*** ad entrambi gli insiemi

DELETE FROM ##TMP_MOD_ANA_SAP
WHERE LSRTIT_CONI_KEY_ID_RICEV IN 
	(SELECT DISTINCT(LSRTIT_CONI_KEY_ID_RICEV)
	 FROM ##TMP_CAMBI_TIT)


SELECT lsrtit_coni_key_id_ricev,
lsrtit_coni_cognome,
lsrtit_coni_nome,
lsrtit_coni_data_validita,
lsrric_key_id_ricev,lsrric_data_validita 
INTO ##TMP_MOD_SAP
FROM ##TMP_MOD_ANA_SAP
FULL OUTER JOIN ##TMP_MOD_RIC_SAP
ON LSRTIT_CONI_KEY_ID_RICEV=LSRRIC_KEY_ID_RICEV

DROP TABLE ##TMP_MOD_ANA_SAP
DROP TABLE ##TMP_MOD_RIC_SAP


--** INSERIMENTO IN ANA_MODIFICHE_LTO0AA DI MODIFICHE ANAGRAFICHE, CESSAZIONI, NUOVI TITOLARI 
--** E CAMBI DI TITOLARITA'
INSERT INTO [DBO].[ANA_MODIFICHE_LTO0AA]
SELECT * 
FROM
(

--*** MODIFICHE ANAGRAFICHE PER LTOOAA - ##TMP_MOD_ANA_LTO
SELECT 
DATA_INS=@DATA,
DATA_VALIDITA=lsrtit_coni_data_validita,
DATA_CESSAZIONE= '99999999',
TIPO_MOD='M',
COD_LOTT=UPPER(lsrtit_coni_key_id_ricev),
ID_CONI=UPPER(lsrtit_coni_codice_coni),
COGNOME=UPPER(lsrtit_coni_cognome),      
NOME=UPPER(lsrtit_coni_nome),
TIPO_GIURIDICO=lsrtit_coni_tipo_rec, 
COD_FISC_TIT=UPPER(lsrtit_coni_codice_fiscale_titolare),-- SE lsrtit_coni_tipo_rec='1' COD FISC TITOLARE
											-- SE lsrtit_coni_tipo_rec='2' COD FISC RAPPRESENTANTE LEGALE
PARTITA_IVA=UPPER(lsrtit_coni_partita_iva),
DENOM=UPPER(lsrtit_coni_denominazione),
INDIRIZZO=UPPER(lsrtit_coni_indirizzo), -- SE lsrtit_coni_tipo_rec='1' INDIRIZZO TITOLARE
											-- SE lsrtit_coni_tipo_rec='2' INDIRIZZO RAPPRESENTANTE LEGALE
CAP=lsrtit_coni_cap, -- COME INDIRIZZO
COMUNE=UPPER(lsrtit_coni_comune), -- COME INDIRIZZO
PROV=UPPER(lsrtit_coni_provincia), -- COME INDIRIZZO
TEL_CASA=lsrtit_coni_tel_casa,
TEL_CELL=lsrtit_coni_tel_cell,
FT_LTO='00000000'
FROM
(
SELECT * FROM ##TMP_MOD_ANA_LTO
)ma_lto

UNION

--*** CESSAZIONI TITOLARE PER LTOOAA - ##TMP_CESSAZ_LTO
SELECT 
DATA_INS=@DATA,
DATA_VALIDITA=lsrtit_coni_data_validita,
DATA_CESSAZIONE= DECOR_DAL,
TIPO_MOD='C',
COD_LOTT=UPPER(lsrtit_coni_key_id_ricev),
ID_CONI=UPPER(lsrtit_coni_codice_coni),
COGNOME=UPPER(lsrtit_coni_cognome),      
NOME=UPPER(lsrtit_coni_nome),
TIPO_GIURIDICO=lsrtit_coni_tipo_rec, 
COD_FISC_TIT=UPPER(lsrtit_coni_codice_fiscale_titolare),-- SE lsrtit_coni_tipo_rec='1' COD FISC TITOLARE
											-- SE lsrtit_coni_tipo_rec='2' COD FISC RAPPRESENTANTE LEGALE
PARTITA_IVA=UPPER(lsrtit_coni_partita_iva),
DENOM=UPPER(lsrtit_coni_denominazione),
INDIRIZZO=UPPER(lsrtit_coni_indirizzo), -- SE lsrtit_coni_tipo_rec='1' INDIRIZZO TITOLARE
											-- SE lsrtit_coni_tipo_rec='2' INDIRIZZO RAPPRESENTANTE LEGALE
CAP=lsrtit_coni_cap, -- COME INDIRIZZO
COMUNE=UPPER(lsrtit_coni_comune), -- COME INDIRIZZO
PROV=UPPER(lsrtit_coni_provincia), -- COME INDIRIZZO
TEL_CASA=lsrtit_coni_tel_casa,
TEL_CELL=lsrtit_coni_tel_cell,
FT_LTO='00000000'
FROM
(
SELECT * FROM ##TMP_CESSAZ_LTO
)csz_lto

UNION

--****** INSERIMENTO PUNTI VENDITA NUOVI, CIOE' PRESENTI SU ANACONDA E NON SU LTO0AA
SELECT 
DATA_INS=@DATA,
DATA_VALIDITA=lsrtit_coni_data_validita,
DATA_CESSAZIONE= '99999999',
TIPO_MOD='I',
COD_LOTT=UPPER(lsrtit_coni_key_id_ricev),
ID_CONI=UPPER(lsrtit_coni_codice_coni),
COGNOME=UPPER(lsrtit_coni_cognome),      
NOME=UPPER(lsrtit_coni_nome),
TIPO_GIURIDICO=lsrtit_coni_tipo_rec, 
COD_FISC_TIT=UPPER(lsrtit_coni_codice_fiscale_titolare),-- SE lsrtit_coni_tipo_rec='1' COD FISC TITOLARE
											-- SE lsrtit_coni_tipo_rec='2' COD FISC RAPPRESENTANTE LEGALE
PARTITA_IVA=UPPER(lsrtit_coni_partita_iva),
DENOM=UPPER(lsrtit_coni_denominazione),
INDIRIZZO=UPPER(lsrtit_coni_indirizzo), -- SE lsrtit_coni_tipo_rec='1' INDIRIZZO TITOLARE
											-- SE lsrtit_coni_tipo_rec='2' INDIRIZZO RAPPRESENTANTE LEGALE
CAP=lsrtit_coni_cap, -- COME INDIRIZZO
COMUNE=UPPER(lsrtit_coni_comune), -- COME INDIRIZZO
PROV=UPPER(lsrtit_coni_provincia), -- COME INDIRIZZO
TEL_CASA=lsrtit_coni_tel_casa,
TEL_CELL=lsrtit_coni_tel_cell,
FT_LTO='00000000'
FROM
(
SELECT * FROM ##TMP_NUOVI_TIT

)nuovi_tit


UNION

--****** INSERIMENTO CAMBI TITOLARITA'
SELECT 
DATA_INS=@DATA,
DATA_VALIDITA=DECOR_DAL,
DATA_CESSAZIONE= '99999999',
TIPO_MOD='I',
COD_LOTT=UPPER(lsrtit_coni_key_id_ricev),
ID_CONI=UPPER(lsrtit_coni_codice_coni),
COGNOME=UPPER(lsrtit_coni_cognome),      
NOME=UPPER(lsrtit_coni_nome),
TIPO_GIURIDICO=lsrtit_coni_tipo_rec, 
COD_FISC_TIT=UPPER(lsrtit_coni_codice_fiscale_titolare),-- SE lsrtit_coni_tipo_rec='1' COD FISC TITOLARE
											-- SE lsrtit_coni_tipo_rec='2' COD FISC RAPPRESENTANTE LEGALE
PARTITA_IVA=UPPER(lsrtit_coni_partita_iva),
DENOM=UPPER(lsrtit_coni_denominazione),
INDIRIZZO=UPPER(lsrtit_coni_indirizzo), -- SE lsrtit_coni_tipo_rec='1' INDIRIZZO TITOLARE
											-- SE lsrtit_coni_tipo_rec='2' INDIRIZZO RAPPRESENTANTE LEGALE
CAP=lsrtit_coni_cap, -- COME INDIRIZZO
COMUNE=UPPER(lsrtit_coni_comune), -- COME INDIRIZZO
PROV=UPPER(lsrtit_coni_provincia), -- COME INDIRIZZO
TEL_CASA=lsrtit_coni_tel_casa,
TEL_CELL=lsrtit_coni_tel_cell,
FT_LTO='00000000'
FROM
(
SELECT * FROM ##TMP_CAMBI_TIT
)cambi_tit

)TUTTO_LTO0AA



--** INSERIMENTO IN ANA_MODIFICHE DI MODIFICHE ANAGRAFICHE, MODIFICHE RICEVITORIA, 
--** NUOVI TITOLARI E CAMBI DI TITOLARITA'
INSERT INTO [DBO].[ANA_MODIFICHE]
SELECT * 
FROM
(

--*** MODIFICHE ANAGRAFICHE PER SAP - ##TMP_MOD_SAP
SELECT 
DATA_INS=@DATA,
DATA_VALIDITA=CASE WHEN lsrtit_coni_key_id_ricev IS NULL THEN lsrric_data_validita
	           WHEN lsrric_key_id_ricev IS NULL THEN lsrtit_coni_data_validita
		   ELSE lsrric_data_validita END,
TIPO_MOD='M',
COD_LOTT=CASE WHEN lsrtit_coni_key_id_ricev IS NULL THEN UPPER(lsrric_key_id_ricev)
	      WHEN lsrric_key_id_ricev IS NULL THEN UPPER(lsrtit_coni_key_id_ricev)
	      ELSE lsrric_key_id_ricev END,
COGNOME=CASE WHEN lsrtit_coni_key_id_ricev IS NULL THEN ''
	      WHEN lsrric_key_id_ricev IS NULL THEN UPPER(lsrtit_coni_cognome)
	      ELSE '' END,
NOME=CASE WHEN lsrtit_coni_key_id_ricev IS NULL THEN ''
	      WHEN lsrric_key_id_ricev IS NULL THEN UPPER(lsrtit_coni_nome)
	      ELSE '' END,
FT_SAP='00000000'
FROM
(
SELECT * FROM ##TMP_MOD_SAP
)ma_sap


UNION

--****** INSERIMENTO PUNTI VENDITA NUOVI, CIOE' PRESENTI SU ANACONDA E NON SU LTO0AA
SELECT 
DATA_INS=@DATA,
DATA_VALIDITA=lsrtit_coni_data_validita,
TIPO_MOD='I',
COD_LOTT=UPPER(lsrtit_coni_key_id_ricev),
COGNOME=UPPER(lsrtit_coni_cognome),
NOME=UPPER(lsrtit_coni_nome),
FT_SAP='00000000'
FROM
(
SELECT * FROM ##TMP_NUOVI_TIT
)nuovi_tit


UNION

--****** INSERIMENTO CAMBI TITOLARITA'
SELECT 
DATA_INS=@DATA,
DATA_VALIDITA=DECOR_DAL,
TIPO_MOD='I',
COD_LOTT=UPPER(lsrtit_coni_key_id_ricev),
COGNOME=UPPER(lsrtit_coni_cognome),
NOME=UPPER(lsrtit_coni_nome),
FT_SAP='00000000'
FROM
(
SELECT * FROM ##TMP_CAMBI_TIT
)cambi_tit

)TUTTO_SAP

--******************************************************************
-- Aggiornamento Cognome e Nome record di ANA_MODIFICHE
-- con i nomi e cognomi delle modifiche anagrafiche del giorno
-- per tutti i record successivi e uguali all'ultimo record
-- di tipo I
--******************************************************************
UPDATE ANA_MODIFICHE
SET COGNOME=lsrtit_coni_cognome,
NOME=lsrtit_coni_nome
FROM
ANA_MODIFICHE,
(
SELECT * FROM ##TMP_MOD_SAP
)M,
(
SELECT COD_LOTT, MAX_DATA=MAX(DATA_VALIDITA)
FROM ANA_MODIFICHE
WHERE TIPO_MOD='I'
GROUP BY COD_LOTT
)I
WHERE ANA_MODIFICHE.COD_LOTT=M.lsrtit_coni_key_id_ricev
AND ANA_MODIFICHE.COD_LOTT=I.COD_LOTT
AND DATA_VALIDITA>=MAX_DATA
AND FT_SAP='00000000'




--******************************************************************
-- INSERIMENTO DOPPIE DELEGHE RID DA INVIARE A SAP
--******************************************************************
INSERT INTO [DBO].[ANA_MODIFICHE]
select DATA_INS=@DATA,
DATA_VALIDITA=lto0aa_data_inizio_val, --da rivedere
TIPO_MOD='D',
COD_LOTT=lto0aa_key_id_ricev,
COGNOME=lto0aa_cognome,
NOME=lto0aa_nome,
FT_SAP='00000000'

from
(
select *
from condiviso.dbo.lto0aa
where lto0aa_key_data_fine_val='99999999'
)lto,
(
--selezione i record che hanno una delega RID aperta con codice banca diverso
--dal codice banca del record immediatamente precedente avente lo stesso cod_lottomatica

select S1.cod_lottomatica,
S1.data_inizio_val, --data inizio nuovo codice
S1.cod_banca
from 
(
select *
from Riscossioni.dbo.DELEGHEBANCA_PV 
where data_fine_val='99999999'
and cod_prodotto='11'
)S1,
(
select D1.cod_lottomatica,D1.cod_banca
from Riscossioni.dbo.DELEGHEBANCA_PV D1,
(
select cod_lottomatica,MAX_DATA=max(data_fine_val)
from Riscossioni.dbo.DELEGHEBANCA_PV
where cod_prodotto='11'
and data_fine_val<>'99999999' 
and data_elab=@DATA_PREC
group by cod_lottomatica
)D2
where D1.cod_lottomatica=D2.cod_lottomatica
and D1.data_fine_val=D2.MAX_DATA
)S2
where 
S1.cod_lottomatica=S2.cod_lottomatica
and S1.cod_banca<>S2.cod_banca

)deleghe
where lto0aa_key_id_ricev=cod_lottomatica
 

DROP TABLE ##TMP_MOD_ANA_LTO
DROP TABLE ##TMP_CESSAZ_LTO
DROP TABLE ##TMP_MOD_SAP
DROP TABLE ##TMP_NUOVI_TIT
DROP TABLE ##TMP_CAMBI_TIT

END
GO
