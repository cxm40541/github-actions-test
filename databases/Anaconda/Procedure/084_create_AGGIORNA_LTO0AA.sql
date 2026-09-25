/****** Object:  StoredProcedure [dbo].[AGGIORNA_LTO0AA]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- *************************************************************************************************
-- La procedura [DBO].[AGGIORNA_LTO0AA] è necessaria per aggiornare la tabella LTO0AA 
-- presente sul db Condiviso.
-- La data @DATA è relativa al giorno del quale si vogliono selezionare le modifiche anagrafiche.
-- La data @DATA_OGGI è sempre la data nella quale si fa girare la procedura.
-- Qualora si intenda aggiornare la tabella LTO0AA con le modifiche anagrafiche del giorno
-- in cui si esegue la procedura, @DATA_OGGI=@DATA
-- *************************************************************************************************

CREATE      PROCEDURE [dbo].[AGGIORNA_LTO0AA] @DATA CHAR(8)
AS
DECLARE
@DATA_OGGI	 		CHAR(8)


SELECT @DATA_OGGI=CONVERT(CHAR,GETDATE(),112)
--SELECT @DATA_OGGI='20031118'

BEGIN TRANSACTION

--**************** MODIFICHE ANAGRAFICHE TIPO_MOD='M'

UPDATE CONDIVISO.dbo.LTO0AA
SET 
-- la lto0aa_data_inizio_val rimane quella in cui è iniziata la validità del titolare
lto0aa_tipo_giuridico=TIPO_GIURIDICO, 
lto0aa_partita_iva=PARTITA_IVA,
lto0aa_codice_fiscale=COD_FISC_TIT,
lto0aa_denominazione=DENOM,
lto0aa_cognome=COGNOME,
lto0aa_nome=NOME,
lto0aa_indirizzo=INDIRIZZO,
lto0aa_comune=COMUNE,
lto0aa_cap=CAP,
lto0aa_provincia=PROV,
lto0aa_telefono_casa=TEL_CASA,
lto0aa_telefono_cell=TEL_CELL,
lto0aa_codice_coni=ID_CONI,
lto0aa_cod_amm=COD_AMM,
lto0aa_data_elab=@DATA_OGGI
FROM
(
	SELECT
	COD_LOTT,
	TIPO_GIURIDICO,
	PARTITA_IVA,
	COD_FISC_TIT,
	DENOM,
	COGNOME,
	NOME,
	INDIRIZZO,
	COMUNE,
	CAP,
	PROV,
	TEL_CASA,
	TEL_CELL,
	ID_CONI,
	COD_AMM=''
	FROM ANACONDA.DBO.ANA_MODIFICHE_LTO0AA
	WHERE TIPO_MOD='M'
	AND DATA_INS=@DATA
)ANA_MOD
WHERE lto0aa_key_id_ricev=COD_LOTT
AND lto0aa_key_data_fine_val='99999999'

IF @@ERROR <> 0 
BEGIN
	ROLLBACK TRANSACTION
	RETURN
END

UPDATE ANACONDA.DBO.ANA_MODIFICHE_LTO0AA
SET FT_LTO=@DATA_OGGI
WHERE TIPO_MOD='M'
AND DATA_INS=@DATA

IF @@ERROR <> 0 
BEGIN
	ROLLBACK TRANSACTION
	RETURN
END
--**************** CESSAZIONI TIPO_MOD='C'

UPDATE CONDIVISO.dbo.LTO0AA
SET 
lto0aa_key_data_fine_val=DATA_CESSAZIONE,
lto0aa_data_elab=@DATA_OGGI
FROM
(
	SELECT 
	COD_LOTT,
	DATA_CESSAZIONE
	FROM ANACONDA.DBO.ANA_MODIFICHE_LTO0AA
	WHERE TIPO_MOD='C'
	AND DATA_INS=@DATA
)ANA_MOD
WHERE lto0aa_key_id_ricev=COD_LOTT AND lto0aa_key_data_fine_val='99999999'

IF @@ERROR <> 0 
BEGIN
	ROLLBACK TRANSACTION
	RETURN
END

UPDATE anaconda.dbo.ANA_MODIFICHE_LTO0AA
SET FT_LTO=@DATA_OGGI
WHERE TIPO_MOD='C'
AND DATA_INS=@DATA

IF @@ERROR <> 0 
BEGIN
	ROLLBACK TRANSACTION
	RETURN
END

--**************** CAMBI TITOLARI O NUOVE INTESTAZIONI TIPO_MOD='I'

INSERT INTO CONDIVISO.dbo.LTO0AA
SELECT 
COD_LOTT,
DATA_FINE='99999999',
DATA_INI=DATA_VALIDITA, 
COD_BANCA='', 
TIPO_GIURIDICO,
PARTITA_IVA,
COD_FISC_TIT,
DENOM,
COGNOME,
NOME,
INDIRIZZO,
COMUNE,
CAP,
PROV,
TEL_CASA,
TEL_CELL,
ID_CONI,
COD_AMM='',
@DATA_OGGI
FROM ANACONDA.DBO.ANA_MODIFICHE_LTO0AA
WHERE TIPO_MOD='I'
AND DATA_INS=@DATA
AND COD_LOTT NOT IN (
	SELECT lto0aa_key_id_ricev
	FROM condiviso.dbo.LTO0AA
	WHERE lto0aa_key_data_fine_val='99999999'
)

IF @@ERROR <> 0 
BEGIN
	ROLLBACK TRANSACTION
	RETURN
END

UPDATE ANACONDA.DBO.ANA_MODIFICHE_LTO0AA
SET FT_LTO=@DATA_OGGI
WHERE TIPO_MOD='I'
AND DATA_INS=@DATA
--Codice commentato da k12414 il 18(/12/2003
--AND COD_LOTT NOT IN
-- (
--	SELECT lto0aa_key_id_ricev
--	FROM condiviso.dbo.LTO0AA
--	WHERE lto0aa_key_data_fine_val='99999999'
--)


IF @@ERROR <> 0 
BEGIN
	ROLLBACK TRANSACTION
	RETURN
END

COMMIT TRANSACTION
GO
