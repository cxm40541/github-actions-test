/****** Object:  StoredProcedure [dbo].[GEV_VARIAZIONE_NUOVI_QUESTIONARI]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE   PROCEDURE [dbo].[GEV_VARIAZIONE_NUOVI_QUESTIONARI] 

@CODLTM		VARCHAR(7),
@CODAMM		VARCHAR(7),
@CODSGI		VARCHAR(7),
@DATADOC	CHAR(8),
@DATAINVIODOC	CHAR(8),
@NUMDOC		VARCHAR(25),
@COGNOME	VARCHAR(24),
@NOME		VARCHAR(20),
@ASSOCIAZIONE	CHAR(1),

@tipo_esercizio	char(2),
@tipo_esercizio_note	varchar(50),
@cat_merc_primaria	char(2),
@cat_merc_primaria_note	varchar(50),
@cat_merc_secondaria	char(2),
@cat_merc_secondaria_note	varchar(50),
@punto_lottomatica	char(1),
@punto_Sisal	char(1),
@punto_Snai	char(1),
@punto_Lis	char(1),
@punto_note	varchar(50),

@presenza_lotto	char(1),
@presenza_superenalotto	char(1),
@presenza_totocalcio	char(1),
@presenza_totip	char(1),
@presenza_ippica	char(1),
@presenza_scommesse	char(1),
@presenza_vlt	char(1),
@presenza_servizi	char(1),
@prodotti_note	varchar(50),
@orario	char(30),
@giorno_riposo	char(1),
@num_vetrine	varchar(2),
@superficie	char(2),
@insegna_esterna	char(1),
@spazio_cliente	char(2),
@spazio_espositivo	char(1),
@tv	char(1),
@pc	char(1),
@stampante	char(1),
@internet	char(1),
@ubicazione	char(2),
@tipo_zona	char(2),
@posizione	char(2),
@tel_prinicipale	char(12),
@tel_alternativo	char(12),
@fax	varchar(12),
@e_mail	varchar(50),


@FLGANAG	CHAR(1),
@FKINSTIT	VARCHAR(16),
@FKINSDOC VARCHAR(16),
@NOTE		VARCHAR(100),
@FIRMA		VARCHAR(17)

AS 
DECLARE

@RETE		CHAR(1),
@RESULT		INT,
@MSGERR		VARCHAR(200),
@RICEAPPO		VARCHAR(7),
@FKDATAINSTIT	CHAR(8),
@FKORAINSTIT	CHAR(8),
@FKDATAINSDOC	CHAR(8),
@FKORAINSDOC	CHAR(8),
@FKDATAINSGEV	CHAR(8),
@FKORAINSGEV	CHAR(8),
@FLGANAGOLD	CHAR(1),
@COGNOMEOLD	VARCHAR(24),
@NOMEOLD		VARCHAR(20)


SELECT @RICEAPPO = NULL
SELECT @FKDATAINSTIT = NULL
SELECT @FKORAINSTIT = NULL
SELECT @FKDATAINSGEV = NULL
SELECT @FKORAINSGEV = NULL

IF ISNUMERIC(LTRIM(RTRIM(@CODLTM) )) = 1	
BEGIN
	SELECT @FKDATAINSGEV = SUBSTRING(@FKINSTIT, 1, 8)
	SELECT @FKORAINSGEV = SUBSTRING(@FKINSTIT, 9, 8)
END
ELSE
BEGIN
	SELECT @FKDATAINSTIT = SUBSTRING(@FKINSTIT, 1, 8)
	SELECT @FKORAINSTIT = SUBSTRING(@FKINSTIT, 9, 8)
END

SELECT @FKDATAINSDOC = SUBSTRING(@FKINSDOC, 1, 8)
SELECT @FKORAINSDOC = SUBSTRING(@FKINSDOC, 9, 8)

--------------------------------------------------------------------------------------------------------------------------------
-- CONTROLLO SE I DATI IN INPUT NON SIANO GIA' PRESENTI IN TABELLA
--------------------------------------------------------------------------------------------------------------------------------



--------------------------------------------------------------------------------------------------------------------------------
-- EFFETTUO I CONTROLLI SU FLAGANAG
--------------------------------------------------------------------------------------------------------------------------------

SELECT @FLGANAGOLD = NULL

SELECT @FLGANAGOLD = LSRQST_GEV_FLAG_ANAG
FROM LSRQST_GEV
WHERE LSRQST_GEV_KEY_ID_RICEV = @CODSGI
AND LSRQST_GEV_KEY_DATA_INS = @FKDATAINSDOC
AND LSRQST_GEV_KEY_ORA_INS = @FKORAINSDOC

IF @FLGANAGOLD = '0' AND @FLGANAG <> '0'
BEGIN

	SELECT @RICEAPPO = NULL

	SELECT @COGNOMEOLD = NULL
	SELECT @NOMEOLD = NULL
	IF ISNUMERIC(LTRIM(RTRIM(@CODLTM) )) = 1	
		SELECT @RICEAPPO = LSRQST_GEV_KEY_ID_RICEV 
		FROM LSRQST_GEV
		WHERE LSRQST_GEV_KEY_ID_RICEV = @CODSGI
		AND LSRQST_GEV_FK_DATA_INS_TIT_GEV = @FKDATAINSGEV
		AND LSRQST_GEV_FK_ORA_INS_TIT_GEV = @FKORAINSGEV
	ELSE
		SELECT @RICEAPPO = LSRQST_GEV_KEY_ID_RICEV 
		FROM LSRQST_GEV
		WHERE LSRQST_GEV_KEY_ID_RICEV = @CODSGI
		AND LSRQST_GEV_FK_DATA_INS_TIT = @FKDATAINSTIT
		AND LSRQST_GEV_FK_ORA_INS_TIT = @FKORAINSTIT

	IF @RICEAPPO IS NOT NULL
	BEGIN
		SELECT @MSGERR = '9 - ESISTE GIA UN QUESTIONARIO ASSOCIATO AL TITOLARE INDICATO'
		RAISERROR (@MSGERR, 16, 1)
		RETURN
	END

END


BEGIN TRANSACTION
 
SELECT @MSGERR = '0 - VARIAZIONE EFFETTUATA CORRETTAMENTE'
RAISERROR (@MSGERR, 16, 1)

UPDATE LSRQST_GEV SET
LSRQST_GEV_DATA_DOCUMENTO = @DATADOC,
LSRQST_GEV_DATA_INVIO_DOC = @DATAINVIODOC,
LSRQST_GEV_NUM_PROT_DOC = @NUMDOC,
LSRQST_GEV_ASSOCIAZIONE = @ASSOCIAZIONE,
LSRQST_GEV_NOME = @NOME,
LSRQST_GEV_COGNOME = @COGNOME,

LSRQST_GEV_NOTE = @NOTE,
LSRQST_GEV_FLAG_ANAG = @FLGANAG,
LSRQST_GeV_fk_data_ins_tit = @FKDATAINSTIT,
LSRQST_GeV_fk_ora_ins_tit = @FKORAINSTIT,
LSRQST_GeV_fk_data_ins_tit_gev = @FKDATAINSGEV,
LSRQST_GeV_fk_ora_ins_tit_gev = @FKORAINSGEV
WHERE LSRQST_GEV_KEY_ID_RICEV = @CODSGI
AND LSRQST_GEV_KEY_DATA_INS = @FKDATAINSDOC 
AND LSRQST_GEV_KEY_ORA_INS = @FKORAINSDOC


IF @@ERROR <> 0
BEGIN
	SELECT @MSGERR = '9 - ERRORE IN VARIAZIONE DOCUMENTO - RICEVITORIA: ' + @CODLTM
	RAISERROR (@MSGERR, 16, 1)
	ROLLBACK TRANSACTION
	RETURN
END
ELSE
BEGIN
	UPDATE LSRQST_GEV_NEW
	SET
	lsrqst_GeV_tipo_esercizio = @tipo_esercizio,
	lsrqst_GeV_tipo_esercizio_note = @tipo_esercizio_note,
	lsrqst_GeV_cat_merc_primaria = @cat_merc_primaria ,
	lsrqst_GeV_cat_merc_primaria_note  = @cat_merc_primaria_note,
	lsrqst_GeV_cat_merc_secondaria  = @cat_merc_secondaria,
	lsrqst_GeV_cat_merc_secondaria_note  = @cat_merc_secondaria_note,
	lsrqst_GeV_punto_lottomatica  = @punto_lottomatica,
	lsrqst_GeV_punto_Sisal  = @punto_Sisal,
	lsrqst_GeV_punto_Snai  = @punto_Snai,
	lsrqst_GeV_punto_Lis  = @punto_Lis,
	lsrqst_GeV_punto_note  = @punto_note,
	lsrqst_GeV_presenza_lotto  = @presenza_lotto,
	lsrqst_GeV_presenza_superenalotto  = @presenza_superenalotto,
	lsrqst_GeV_presenza_totocalcio  = @presenza_totocalcio,
	lsrqst_GeV_presenza_totip  = @presenza_totip,
	lsrqst_GeV_presenza_ippica  = @presenza_ippica,
	lsrqst_GeV_presenza_scommesse  = @presenza_scommesse,
	lsrqst_GeV_presenza_vlt  = @presenza_vlt,
	lsrqst_GeV_presenza_servizi  = @presenza_servizi,
	lsrqst_Gev_prodotti_note  = @prodotti_note,
	lsrqst_GeV_orario  = @orario,
	lsrqst_GeV_giorno_riposo  = @giorno_riposo,
	lsrqst_GeV_num_vetrine  = @num_vetrine,
	lsrqst_GeV_superficie  = @superficie,
	lsrqst_GeV_insegna_esterna  = @insegna_esterna,
	lsrqst_GeV_spazio_cliente  = @spazio_cliente,
	lsrqst_GeV_spazio_espositivo  = @spazio_espositivo,
	lsrqst_GeV_tv  = @tv,
	lsrqst_GeV_pc  = @pc,
	lsrqst_GeV_stampante  = @stampante,
	lsrqst_GeV_internet  = @internet,
	lsrqst_GeV_ubicazione  = @ubicazione,
	lsrqst_GeV_tipo_zona  = @tipo_zona,
	lsrqst_GeV_posizione  = @posizione,
	lsrqst_GeV_tel_prinicipale  = @tel_prinicipale,
	lsrqst_GeV_tel_alternativo  = @tel_alternativo,
	lsrqst_GeV_fax  = @fax,
	lsrqst_GeV_e_mail  = @e_mail

	WHERE LSRQST_GEV_KEY_ID_RICEV = @CODSGI
	AND LSRQST_GEV_KEY_DATA_INS = @FKDATAINSDOC 
	AND LSRQST_GEV_KEY_ORA_INS = @FKORAINSDOC

	COMMIT TRANSACTION
END
GO
