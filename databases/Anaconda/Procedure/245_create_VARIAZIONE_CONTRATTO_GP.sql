/****** Object:  StoredProcedure [dbo].[VARIAZIONE_CONTRATTO_GP]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[VARIAZIONE_CONTRATTO_GP]


	@RICEV 		CHAR(6),
	@NOMEFILE	VARCHAR(255),
	@DATAINVIODOC	CHAR(8),
	@DATADOC	CHAR(8),
	@NUMPROTDOC	CHAR(25),
	@COGNOME	CHAR(24),
	@NOME		CHAR(20),
	@PARTITAIVA	CHAR(11),
	@CODICEFISCALE	CHAR(16),
	@FLAGANAG	CHAR(1),
	@FKDATAINSTIT	CHAR(8),
	@FKORAINSTIT	CHAR(8),

	@KEYDATAINSDOC	CHAR(8),
	@KEYORAINSDOC	CHAR(8),
	@ABBINATO 		CHAR(1),

	@FIRMA		CHAR(17),	
	@aggio char(1),
	@c_app_supp char(1),
	@c_term_rete char(1),
	@flag_subentro char(1),
	@tipo_pv char(1),	
	@MSGERR 	VARCHAR(100) OUTPUT
 AS


DECLARE 	

@APPORICEV		CHAR(6),
@CHKRICEV		CHAR(6),
@DATAOGGI   		CHAR(8),
@ORAOGGI  		CHAR(8),
@COGNOMETIT		CHAR(24),
@NOMETIT		CHAR(20),
@FLAGANAGTIT		CHAR(1),
@DATAINSTIT		CHAR(8),
@ORAINSTIT		CHAR(8),
@TIPOPREC 		CHAR(1),
@TIPOPROVV		CHAR(1),
@TITTROVATO 		CHAR(1),
@FLAGOK 		CHAR(1)


SELECT @DATAOGGI = CONVERT (VARCHAR(10), GETDATE(),112)
SELECT @ORAOGGI =
	SUBSTRING(CONVERT (VARCHAR(22), GETDATE(),121),12,2)+
 	SUBSTRING(CONVERT (VARCHAR(22), GETDATE(),121),15,2)+
 	SUBSTRING(CONVERT (VARCHAR(22), GETDATE(),121),18,2)+
 	SUBSTRING(CONVERT (VARCHAR(22), GETDATE(),121),21,2)




--EFFETTUO I SEGUENTI CONTROLLI:
-- 1) SE IL ABBINATO = '0' E FLAGANAG è <>0 VERIFICO CHE NON SIA GIà PRESENTE UN CONTRATTO PER IL RICEVITORE E LA RICEVITORIA IN QUESTIONE
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


IF (@ABBINATO = '0' AND @FLAGANAG <> '0')
BEGIN
	SELECT @APPORICEV = lsrcon_gp_KEY_ID_RICEV 
	FROM lsrcon_gp
	WHERE lsrcon_gp_KEY_ID_RICEV = @RICEV
		AND lsrcon_gp_FK_DATA_INS_TIT = @FKDATAINSTIT
		AND lsrcon_gp_FK_ORA_INS_TIT = @FKORAINSTIT



	IF (@APPORICEV <>'' OR @APPORICEV IS NOT NULL)
	BEGIN
		SELECT @MSGERR = '9999 - ' + @RICEV +' PER LA RIC. ESISTE UN CONTRATTO PER IL TIT. E ANNO RIF. INDICATI - CON. NON ACQUISITO'
		RETURN
	END
END


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
--           IL RECORD VIENE AGGIORNATO SU lsrcon_gp
--*************************************************************************
 
UPDATE lsrcon_gp 
SET 	--lsrcon_gp_key_data_ins = @DATAOGGI,
	--lsrcon_gp_key_ora_ins = @ORAOGGI,
	lsrcon_gp_data_contratto = @DATADOC,		
	lsrcon_gp_data_invio_doc = @DATAINVIODOC,	
	lsrcon_gp_num_prot_doc = @NUMPROTDOC,	
	lsrcon_gp_cognome = @COGNOME,	
	lsrcon_gp_nome = @NOME	,	
	lsrcon_gp_partita_iva = @PARTITAIVA,
	lsrcon_gp_codice_fiscale = @CODICEFISCALE,
	lsrcon_gp_flag_anag = @FLAGANAG,	
	lsrcon_gp_fk_data_ins_tit = @FKDATAINSTIT,	
	lsrcon_gp_fk_ora_ins_tit = @FKORAINSTIT,	
	lsrcon_gp_firma = @FIRMA,
	lsrcon_gp_aggio = @AGGIO,
	lsrcon_gp_c_app_supp=@c_app_supp,
	lsrcon_gp_c_term_rete=@c_term_rete,
	lsrcon_gp_flag_subentro=@flag_subentro,
	lsrcon_gp_tipo_pv=@tipo_pv	
WHERE lsrcon_gp_KEY_ID_RICEV = @RICEV
	AND lsrcon_gp_KEY_DATA_INS = @KEYDATAINSDOC
	AND lsrcon_gp_KEY_ORA_INS = @KEYORAINSDOC

IF @@ERROR <> 0 
BEGIN
	SELECT @MSGERR = '9999 - ' + @RICEV +' ERRORE INSERIMENTO CONTRATTO - CONTRATTO NON ACQUISITO'
	RETURN
END
ELSE
BEGIN
	SELECT @MSGERR = '9999 - ' + @RICEV +' CONTRATTO ACQUISITO CORRETTAMENTE'
	RETURN
END
GO
