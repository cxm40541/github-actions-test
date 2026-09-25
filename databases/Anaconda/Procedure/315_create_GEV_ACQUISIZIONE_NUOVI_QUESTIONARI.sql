/****** Object:  StoredProcedure [dbo].[GEV_ACQUISIZIONE_NUOVI_QUESTIONARI]    Script Date: 11/17/2025 15:18:32 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE   PROCEDURE [dbo].[GEV_ACQUISIZIONE_NUOVI_QUESTIONARI] 

@CODLTM		VARCHAR(7),
@CODAMM		VARCHAR(7),
@CODSGI		VARCHAR(7),
@DATAINS	CHAR(8),
@ORAINS		CHAR(8),
@TIPOACQ	CHAR(1),
@DATADOC	CHAR(8),
@DATAINVIODOC	CHAR(8),
@PROTDOC	VARCHAR(25),
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
@NOTE		VARCHAR(100),
@FIRMA		VARCHAR(17)

AS 

DECLARE

@RETE		CHAR(1),
@RESULT		INT,
@MSGERR		VARCHAR(200),
@RICEAPPO		VARCHAR(7),
@DATAAPPO		CHAR(8),
@FKDATAINSTIT	CHAR(8),
@FKORAINSTIT	CHAR(8),
@FKDATAINSTITGEV	CHAR(8),
@FKORAINSTITGEV	CHAR(8),
@COGNOMEOLD	VARCHAR(24),
@NOMEOLD		VARCHAR(20),
@FLGANAGOLD	CHAR(1)


SELECT @RICEAPPO = ''
SELECT @FKDATAINSTITGEV = null
SELECT @FKORAINSTITGEV = null
SELECT @FKDATAINSTIT = null
SELECT @FKORAINSTIT = null

IF ISNUMERIC(LTRIM(RTRIM(@CODLTM) )) = 1
BEGIN
	SELECT @FKDATAINSTITGEV = SUBSTRING(@FKINSTIT, 1, 8)
	SELECT @FKORAINSTITGEV = SUBSTRING(@FKINSTIT, 9, 8)

END
ELSE
BEGIN
	SELECT @FKDATAINSTIT = SUBSTRING(@FKINSTIT, 1, 8)
	SELECT @FKORAINSTIT = SUBSTRING(@FKINSTIT, 9, 8)

END


SELECT @MSGERR = NULL

/* 	COMMENTO AGGIUNTO DA CDS: I CODICI SONO GIà TUTTI VALORIZZATI, QUINDI
	LE CHIAMATE SONO INUTILI

EXEC GEV_ESISTE_RICEVITORIA @CODLTM OUTPUT, @CODAMM OUTPUT, @CODSGI OUTPUT

SET @MSGERR = @@ERROR

IF @MSGERR <> 0
BEGIN
	RAISERROR (@MSGERR, 16, 1)
	RETURN
END

SELECT @MSGERR = NULL

EXEC GEV_DECOD_RICEV @CODLTM, @CODSGI OUTPUT

SET @MSGERR = @@ERROR

IF @MSGERR <> 0
BEGIN
	RAISERROR (@MSGERR, 16, 1)
	RETURN
END
*/
-------------------------------------------------------------
-- CONTROLLO SE GIA' ESISTE UN QUESTIONARIO PER QUEL CONTRAENTE
-------------------------------------------------------------

SELECT @RICEAPPO = ''
SELECT @MSGERR = NULL

SELECT @COGNOMEOLD = ''
SELECT @NOMEOLD = NULL

SELECT @COGNOMEOLD = LSRQST_GEV_COGNOME, @NOMEOLD = LSRQST_GEV_NOME
FROM LSRQST_GEV
WHERE LSRQST_GEV_KEY_ID_RICEV = @CODSGI
AND LSRQST_GEV_COGNOME = @COGNOME
AND LSRQST_GEV_NOME = @NOME


IF @@ROWCOUNT > 0
BEGIN
	SELECT @MSGERR = '9 - ESISTE GIA UN QUESTIONARIO INTESTATO A: ' + @COGNOME + ' ' + @NOME
	RAISERROR (@MSGERR, 16, 1)
	RETURN
END


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- IMPOSTO IL TIPO DI ASSOCIAZIONE TRA DOCUMENTO E CONTRAENTE (SOLO PER ACQUISIZIONE DA FILE)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

IF @TIPOACQ = 'F'
BEGIN

	SELECT @MSGERR = NULL
	SELECT @FLGANAG = NULL
	SELECT @FKDATAINSTIT = NULL
	SELECT @FKORAINSTIT = NULL
	SELECT @FKDATAINSTITGEV = null
	SELECT @FKORAINSTITGEV = null

	EXEC GEV_ESISTE_RICEVITORIA @CODLTM OUTPUT, @CODAMM OUTPUT, @CODSGI OUTPUT
	SET @MSGERR = @@ERROR
	
	IF @MSGERR <> 0
	BEGIN
		RAISERROR (@MSGERR, 16, 1)
		RETURN
	END


	IF ISNUMERIC(LTRIM(RTRIM(@CODLTM) )) = 1	
		EXEC GEV_ASSOCIA_TITOLARE_DOCUMENTO_CONI @CODLTM, @COGNOME, @NOME, @FLGANAG OUTPUT, @FKDATAINSTITGEV OUTPUT, @FKORAINSTITGEV OUTPUT
	ELSE	
		EXEC GEV_ASSOCIA_TITOLARE_DOCUMENTO @CODLTM, @COGNOME, @NOME, @FLGANAG OUTPUT, @FKDATAINSTIT OUTPUT, @FKORAINSTIT OUTPUT


	SET @MSGERR = @@ERROR
	
	IF @MSGERR <> 0
	BEGIN
		RAISERROR (@MSGERR, 16, 1)
		RETURN
	END
END

SELECT @RICEAPPO = NULL
SELECT @FLGANAGOLD = NULL
SELECT @MSGERR = NULL

SELECT @FLGANAGOLD = LSRQST_GEV_FLAG_ANAG
FROM LSRQST_GEV
WHERE LSRQST_GEV_KEY_ID_RICEV = @CODSGI
AND LSRQST_GEV_FLAG_ANAG = @FLGANAG

IF @FLGANAGOLD IS NOT NULL
BEGIN
	IF @FLGANAG = '0'
	BEGIN
		SELECT @MSGERR = '9 - ESISTE GIA UN DOCUMENTO NON ASSOCIATO'
		RAISERROR (@MSGERR, 16, 1)
		RETURN
	END
	ELSE IF @FLGANAG = '1'
	BEGIN
		SELECT @MSGERR = '9 - ESISTE GIA UN DOCUMENTO ASSOCIATO AL TITOLARE ATTUALE'
		RAISERROR (@MSGERR, 16, 1)
		RETURN
	END
	ELSE IF @FLGANAG = '2' 
	BEGIN
		SELECT @MSGERR = '9 - ESISTE GIA UN DOCUMENTO ASSOCIATO AD UN TITOLARE PRECEDENTE'
		RAISERROR (@MSGERR, 16, 1)
		RETURN
	END
END	
ELSE
BEGIN
	IF @FLGANAG = '0'
	BEGIN
		SELECT @FKDATAINSTIT = NULL
		SELECT @FKORAINSTIT = NULL
		SELECT @FKDATAINSTITGEV = null
		SELECT @FKORAINSTITGEV = null

		SELECT @MSGERR = '0 - DOCUMENTO NON ASSOCIATO AD ALCUN TITOLARE'
		RAISERROR (@MSGERR, 16, 1)
	END
	ELSE IF @FLGANAG = '1'
	BEGIN
		SELECT @MSGERR = '0 - DOCUMENTO ASSOCIATO AL TITOLARE ATTUALE'
		RAISERROR (@MSGERR, 16, 1)
	END
	ELSE IF @FLGANAG >= '2' 
	BEGIN
		SELECT @MSGERR = '0 - DOCUMENTO ASSOCIATO AD UN TITOLARE PRECEDENTE'
		RAISERROR (@MSGERR, 16, 1)
	END

END

BEGIN TRANSACTION
INSERT INTO LSRQST_GEV_new values(
	@CODSGI, 
	@DATAINS, 
	@ORAINS, 
	@CODLTM, 
@tipo_esercizio,
@tipo_esercizio_note,
@cat_merc_primaria,
@cat_merc_primaria_note,
@cat_merc_secondaria,
@cat_merc_secondaria_note,
@punto_lottomatica,
@punto_Sisal,
@punto_Snai,
@punto_Lis,
@punto_note,
@ASSOCIAZIONE,
@presenza_lotto,
@presenza_superenalotto,
@presenza_totocalcio,
@presenza_totip,
@presenza_ippica,
@presenza_scommesse,
@presenza_vlt,
@presenza_servizi,
@prodotti_note,
@orario,
@giorno_riposo,
@num_vetrine,
@superficie	,
@insegna_esterna,
@spazio_cliente,
@spazio_espositivo,
@tv	,
@pc	,
@stampante	,
@internet	,
@ubicazione	,
@tipo_zona	,
@posizione	,
@tel_prinicipale	,
@tel_alternativo	,
@fax	,
@e_mail	)

IF @@ERROR <> 0
BEGIN
	SELECT @MSGERR = '9 - ERRORE IN ACQUISIZIONE DOCUMENTO'
	RAISERROR (@MSGERR, 16, 1)
	ROLLBACK TRANSACTION
	RETURN
END
ELSE
BEGIN
	
	INSERT INTO LSRQST_GEV VALUES
	(@CODSGI, 
	@DATAINS, 
	@ORAINS, 
	@CODLTM, 
	@CODAMM, 
	@TIPOACQ, 
	@DATADOC, 
	@DATAINVIODOC, 
	@PROTDOC, 
	@ASSOCIAZIONE,
	@COGNOME, 
	@NOME, 
	
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	'',
	@note,
	
	@DATAINS,
	@ORAINS,
	
	@FLGANAG, 
	@FKDATAINSTIT, 
	@FKORAINSTIT, 
	@FKDATAINSTITGEV, 
	@FKORAINSTITGEV, 
	@FIRMA)

	IF @@ERROR <> 0
	BEGIN
		SELECT @MSGERR = '9 - ERRORE IN ACQUISIZIONE DOCUMENTO'
		RAISERROR (@MSGERR, 16, 1)
		ROLLBACK TRANSACTION
		RETURN
	END
	ELSE
	BEGIN

		COMMIT TRANSACTION
	END
END
GO
