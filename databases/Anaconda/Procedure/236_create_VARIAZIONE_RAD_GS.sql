/****** Object:  StoredProcedure [dbo].[VARIAZIONE_RAD_GS]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[VARIAZIONE_RAD_GS]  

	@RICEV 			CHAR(6),
	@TIPOMOVIMENTAZIONE	CHAR(1),
	@FONTE			CHAR(1),  
	@CODICESERVIZIO CHAR(2),
	@FIRMADOC 			CHAR(17),
	@NOMEFILE			VARCHAR(255),
	@DATAINVIODOC		CHAR(8),
	@DATADOC			CHAR(8),
	@NUMPROTDOC		CHAR(25),
	@STATODOC			CHAR(1),
	@CAUSALE			CHAR(2),
	@ASSOCIAZIONE		CHAR(1),
	@COGNOME			CHAR(24),
	@NOME			CHAR(20),
	@NOTE			CHAR(100),
	@FLAGANAG			CHAR(1),
	@FKDATAINSTIT		CHAR(8),
	@FKORAINSTIT		CHAR(8),

	@KEYDATAINSDOC	CHAR(8),
	@KEYORAINSDOC	CHAR(8),
	@ABBINATO 		CHAR(1),

	@FIRMA			CHAR(17),
	@MSGERR 			VARCHAR(100) OUTPUT

 AS

DECLARE 	

@APPORICEV		CHAR(6),
@DATAOGGI   		CHAR(8),
@ORAOGGI  		CHAR(8),
@COGNOMETIT	CHAR(24),
@NOMETIT		CHAR(20),
@FLAGANAGTIT	CHAR(1),
@DATAINSTIT		CHAR(8),
@ORAINSTIT		CHAR(8),
@TIPOPREC 		CHAR(1),
@TIPOPROVV		CHAR(1),
@TITTROVATO   	CHAR(1),
@FLAGOK 		CHAR(1),
@CHKRICEV		CHAR(6)

SELECT @DATAOGGI = CONVERT (VARCHAR(10), GETDATE(),112)
SELECT @ORAOGGI =
	SUBSTRING(CONVERT (VARCHAR(22), GETDATE(),121),12,2)+
 	SUBSTRING(CONVERT (VARCHAR(22), GETDATE(),121),15,2)+
 	SUBSTRING(CONVERT (VARCHAR(22), GETDATE(),121),18,2)+
 	SUBSTRING(CONVERT (VARCHAR(22), GETDATE(),121),21,2)

--EFFETTUO I SEGUENTI CONTROLLI:
-- 1) SE IL ABBINATO = '0' E FLAGANAG è <>0 VERIFICO CHE NON SIA GIà PRESENTE UN RAD PER IL RICEVITORE E LA RICEVITORIA IN QUESTIONE
-- 2) SE IL NOME/COGNOME NON è VALORIZZATO, MA è VALORIZZATO LA FK DEL TIT, PRENDO I VALORI DA LSRTIT

SELECT @CHKRICEV = NULL

SELECT @CHKRICEV = LSRTIT_CONI_KEY_ID_RICEV FROM LSRTIT_CONI
WHERE LSRTIT_CONI_KEY_ID_RICEV = @RICEV

IF @CHKRICEV IS NULL

BEGIN
	SELECT @MSGERR = '8888 - ' + @RICEV +' RICEVITORIA INESISTENTE'
	RETURN
END


--*************************************************************************
--           CONTROLLO 1
--*************************************************************************
/*
IF (@ABBINATO = '0' AND @FLAGANAG <> '0')
BEGIN

	SELECT @APPORICEV = lsrrad_gs_KEY_ID_RICEV 
	FROM lsrrad_gs
	WHERE lsrrad_gs_KEY_ID_RICEV = @RICEV
		AND lsrrad_gs_fk_data_ins_tit  =@FKDATAINSTIT
		AND lsrrad_gs_fk_ORa_ins_tit = @FKORAINSTIT

	IF (@APPORICEV <>'' OR @APPORICEV IS NOT NULL)
	BEGIN
		SELECT @MSGERR = '9999 - ' + @RICEV +'PER LA RICEVITORIA ESISTE UN RAD ABBINATO - RAD NON ACQUISITO'
		RETURN
	END
END
*/
--*************************************************************************
--           CONTROLLO 2
--*************************************************************************

IF @FLAGANAG <> '0' AND (@COGNOME = '' OR @COGNOME IS NULL)
BEGIN
	SELECT  @COGNOME = LSRTIT_CONI_COGNOME , @NOME = LSRTIT_CONI_NOME
	FROM LSRTIT_CONI
	WHERE LSRTIT_CONI_KEY_ID_RICEV=@RICEV 
		AND LSRTIT_CONI_KEY_DATA_INS = @FKDATAINSTIT
		AND LSRTIT_CONI_KEY_ORA_INS = @FKORAINSTIT

END 


--*************************************************************************
--           CONTROLLO 3
--*************************************************************************

IF @FLAGANAG <> '0' 
BEGIN
	SELECT  @FLAGANAG = LSRTIT_CONI_FLAG_ANAG
	FROM LSRTIT_CONI
	WHERE LSRTIT_CONI_KEY_ID_RICEV=@RICEV 
		AND LSRTIT_CONI_KEY_DATA_INS = @FKDATAINSTIT
		AND LSRTIT_CONI_KEY_ORA_INS = @FKORAINSTIT

END 

IF @FLAGANAG = '0' 
BEGIN
	SELECT @FKDATAINSTIT = NULL	
	SELECT @FKORAINSTIT = NULL	
END


--*************************************************************************
--           IL RECORD VIENE INSERITO SU lsrrad_gs
--*************************************************************************
UPDATE lsrrad_gs 
SET	
	--lsrrad_gs_key_data_ins = @DATAOGGI,                 
	--lsrrad_gs_key_ora_ins = @ORAOGGI,
	lsrrad_gs_codice_servizio = @CODICESERVIZIO,                  
	lsrrad_gs_tipo_movimentazione = @TIPOMOVIMENTAZIONE,
	lsrrad_gs_fonte = @FONTE,  
	lsrrad_gs_firma_doc = @FIRMADOC,	
	lsrrad_gs_data_decor = @DATADOC,	
	lsrrad_gs_data_doc = @DATADOC,	
	lsrrad_gs_data_invio_doc = @DATAINVIODOC,	
	lsrrad_gs_num_prot_doc = @NUMPROTDOC,	
	lsrrad_gs_cod_associazione = @ASSOCIAZIONE,	
	lsrrad_gs_causale_lottomatica = @CAUSALE, 
	lsrrad_gs_stato = @STATODOC,	
	lsrrad_gs_cognome = @COGNOME,	
	lsrrad_gs_nome = @NOME	,	
	lsrrad_gs_note = @NOTE,	
	lsrrad_gs_flag_anag = @FLAGANAG,	
	lsrrad_gs_fk_data_ins_tit = @FKDATAINSTIT,	
	lsrrad_gs_fk_ora_ins_tit = @FKORAINSTIT,	
	lsrrad_gs_firma = @FIRMA	
WHERE LSRRAD_GS_KEY_ID_RICEV = @RICEV
	AND LSRRAD_GS_KEY_DATA_INS = @KEYDATAINSDOC
	AND LSRRAD_GS_KEY_ORA_INS = @KEYORAINSDOC
 
IF @@ERROR <> 0 
BEGIN
	SELECT @MSGERR = '9999 - ' + @RICEV +' ERRORE INSERIMENTO RAD - RAD NON ACQUISITO'
	RETURN
END
ELSE
BEGIN
	SELECT @MSGERR = '9999 - ' + @RICEV +'RAD VARIATO  CORRETTAMENTE'
	RETURN
END
GO
