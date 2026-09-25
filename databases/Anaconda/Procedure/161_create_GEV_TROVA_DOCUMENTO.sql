/****** Object:  StoredProcedure [dbo].[GEV_TROVA_DOCUMENTO]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE   PROCEDURE [dbo].[GEV_TROVA_DOCUMENTO] 

@TIPODOC		CHAR(3),
@CODLTM		VARCHAR(7),
@FKDATAINS		CHAR(8),
@FKORAINS		CHAR(8)

AS

DECLARE @APPO as char (8)

--IF @FKDATAINS IS NULL OR LTRIM(RTRIM(@FKDATAINS)) = ''
IF @FKDATAINS = '00000000' OR LTRIM(RTRIM(@FKDATAINS)) = ''
BEGIN

	SELECT @FKDATAINS = null
	SELECT @FKORAINS = null
END

IF ISNUMERIC(LTRIM(RTRIM(@CODLTM) )) = 1 ---and left(LTRIM(RTRIM(@CODLTM)),1)<>'6'
BEGIN
	IF @TIPODOC = 'CON'
	BEGIN
		IF @FKDATAINS IS null
	
			SELECT  LSRCON_GEV_DATA_DOCUMENTO, LSRCON_GEV_DATA_INVIO_DOC, LSRCON_GEV_FLAG_ANAG,
				LSRCON_GEV_NUM_PROT_DOC, LSRCON_GEV_COGNOME, LSRCON_GEV_NOME, 
				LSRCON_GEV_NOTE, LSRCON_GEV_KEY_DATA_INS, LSRCON_GEV_KEY_ORA_INS,
				'', '',
				CASE LSRCON_GEV_FLAG_ANAG
				WHEN '0' THEN 'NON ABBINATO'
				WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
				ELSE  'ABBINATO TITOLARE PRECEDENTE'
				END
				ABBINAMENTO,

				CASE LSRASS_KEY_COD_ASS
				when  null then ''
				else LSRASS_KEY_COD_ASS
				end 
				associazione,
				LSRASS_DESCRIZIONE,

				lsrcon_GeV_comune_residenza,
				lsrcon_GeV_provincia_residenza,
				lsrcon_GeV_cap_residenza,
				lsrcon_GeV_indirizzo_residenza,

				lsrcon_GeV_comune_spedizione,
				lsrcon_GeV_provincia_spedizione,
				lsrcon_GeV_cap_spedizione,
				lsrcon_GeV_indirizzo_spedizione,
				lsrcon_GeV_referente_spedizione,

				lsrcon_GeV_telefono,
				lsrcon_GeV_cod_fisc,
				lsrcon_GeV_partita_iva,
				lsrcon_GeV_comune,
				lsrcon_GeV_provincia,
				lsrcon_GeV_cap,
				lsrcon_GeV_indirizzo,
				lsrcon_gev_numero_pacchi,
				lsrcon_gev_cod_merce,
				lsrcon_gev_email,
				LSRCON_GEV_FLAG_NUOVO_CON,
				LSRCON_GEV_DATA_NUOVO_CON
		
			FROM LSRCON_GEV left join LSRASS on LSRASS_KEY_COD_ASS = LSRCON_GEV_ASSOCIAZIONE
			WHERE LSRCON_GEV_COD_LOTTO = @CODLTM
			AND LSRCON_GEV_FK_DATA_INS_TIT_GEV IS NULL
			AND LSRCON_GEV_FK_ORA_INS_TIT_GEV IS NULL
			--AND LSRASS_KEY_COD_ASS = LSRCON_GEV_ASSOCIAZIONE

		ELSE		
			SELECT  LSRCON_GEV_DATA_DOCUMENTO, LSRCON_GEV_DATA_INVIO_DOC, LSRCON_GEV_FLAG_ANAG,
				LSRCON_GEV_NUM_PROT_DOC, LSRCON_GEV_COGNOME, LSRCON_GEV_NOME, 
				LSRCON_GEV_NOTE, LSRCON_GEV_KEY_DATA_INS, LSRCON_GEV_KEY_ORA_INS,
				LSRTIT_CONI_COGNOME, LSRTIT_CONI_NOME,
				CASE LSRCON_GEV_FLAG_ANAG
				WHEN '0' THEN 'NON ABBINATO'
				WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
				ELSE  'ABBINATO TITOLARE PRECEDENTE'
				END
				ABBINAMENTO,

				CASE LSRASS_KEY_COD_ASS
				when  null then ''
				else LSRASS_KEY_COD_ASS
				end 
				associazione,
				LSRASS_DESCRIZIONE,

				lsrcon_GeV_comune_residenza,
				lsrcon_GeV_provincia_residenza,
				lsrcon_GeV_cap_residenza,
				lsrcon_GeV_indirizzo_residenza,

				lsrcon_GeV_comune_spedizione,
				lsrcon_GeV_provincia_spedizione,
				lsrcon_GeV_cap_spedizione,
				lsrcon_GeV_indirizzo_spedizione,
				lsrcon_GeV_referente_spedizione,

				lsrcon_GeV_telefono,
				lsrcon_GeV_cod_fisc,
				lsrcon_GeV_partita_iva,
				lsrcon_GeV_comune,
				lsrcon_GeV_provincia,
				lsrcon_GeV_cap,
				lsrcon_GeV_indirizzo,
				lsrcon_gev_numero_pacchi,
				lsrcon_gev_cod_merce,
				lsrcon_gev_email,
				LSRCON_GEV_FLAG_NUOVO_CON,
				LSRCON_GEV_DATA_NUOVO_CON
		
			FROM LSRCON_GEV left join LSRASS on LSRASS_KEY_COD_ASS = LSRCON_GEV_ASSOCIAZIONE, 
				LSRTIT_CONI
			WHERE LSRCON_GEV_COD_LOTTO = @CODLTM
			AND LSRCON_GEV_FK_DATA_INS_TIT_GEV = @FKDATAINS
			AND LSRCON_GEV_FK_ORA_INS_TIT_GEV = @FKORAINS
			--AND LSRASS_KEY_COD_ASS = LSRCON_GEV_ASSOCIAZIONE
			AND LSRTIT_CONI_KEY_ID_RICEV = @CODLTM
			AND LSRTIT_CONI_KEY_DATA_INS = @FKDATAINS
			AND LSRTIT_CONI_KEY_ORA_INS = @FKORAINS
	
	END
	
	
	
	IF @TIPODOC = 'QUE'
	BEGIN
		IF @FKDATAINS IS null
		BEGIN
			select @APPO = null
			select @APPO = LSRQST_GEV_FK_DATA_INS_QST_NEW 
			from lsrqst_gev
			where 	LSRQST_GEV_COD_LOTTO = @CODLTM
				AND LSRQST_GEV_FK_DATA_INS_TIT_GEV IS NULL
				AND LSRQST_GEV_FK_ORA_INS_TIT_GEV IS NULL

			-- VECCHIO QUESTIONARIO
			if @APPO IS null	

				SELECT  LSRQST_GEV_DATA_DOCUMENTO, LSRQST_GEV_DATA_INVIO_DOC, LSRQST_GEV_FLAG_ANAG,
					LSRQST_GEV_NUM_PROT_DOC, LSRQST_GEV_COGNOME, LSRQST_GEV_NOME, 
					LSRQST_GEV_NOTE, LSRQST_GEV_KEY_DATA_INS, LSRQST_GEV_KEY_ORA_INS,
					'', '',
					CASE LSRQST_GEV_FLAG_ANAG
					WHEN '0' THEN 'NON ABBINATO'
					WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
					ELSE 'ABBINATO TITOLARE PRECEDENTE'
					END
					ABBINAMENTO,
	
					CASE LSRASS_KEY_COD_ASS
					when  null then ''
					else LSRASS_KEY_COD_ASS
					end 
					associazione,
					LSRASS_DESCRIZIONE,
					'V' TIPOQST,
			
					LSRQST_GEV_TIPO_ESERCIZIO,
					LSRQST_GEV_ANNO_INIZIO,
					LSRQST_GEV_ORARIO,
					LSRQST_GEV_GIORNO_RIPOSO,
					LSRQST_GEV_NUM_VETRINE,
					LSRQST_GEV_SUPERFICIE,
					LSRQST_GEV_INSEGNA_ESTERNA,
					LSRQST_GEV_SPAZIO_CLIENTE,
					LSRQST_GEV_SPAZIO_ESPOSITIVO,
					LSRQST_GEV_SPAZIO_ESPOSITORI,
					LSRQST_GEV_PRESENZA_SUPERENALOTTO,
					LSRQST_GEV_PRESENZA_TOTOCALCIO,
					LSRQST_GEV_PRESENZA_TOTIP,
					LSRQST_GEV_PRESENZA_TRIS,
					LSRQST_GEV_PRESENZA_F101,
					LSRQST_GEV_PRESENZA_GEV,
					LSRQST_GEV_INCASSO_GEV,
					LSRQST_GEV_PC,
					LSRQST_GEV_STAMPANTE,
					LSRQST_GEV_INTERNET,
					LSRQST_GEV_UBICAZIONE,
					LSRQST_GEV_VICINO_A,
					LSRQST_GEV_TEL_PRINICIPALE,
					LSRQST_GEV_TEL_ALTERNATIVO,
					LSRQST_GEV_FAX,
					LSRQST_GEV_E_MAIL
			
				FROM LSRQST_GEV left join LSRASS on LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE
				WHERE LSRQST_GEV_COD_LOTTO = @CODLTM
				AND LSRQST_GEV_FK_DATA_INS_TIT_GEV IS NULL
				AND LSRQST_GEV_FK_ORA_INS_TIT_GEV IS NULL
				--AND LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE
			else
			-- PRENDO I DATI DEL NUOVO QUESTIONARIO
				SELECT  A.LSRQST_GEV_DATA_DOCUMENTO, A.LSRQST_GEV_DATA_INVIO_DOC, A.LSRQST_GEV_FLAG_ANAG,
					A.LSRQST_GEV_NUM_PROT_DOC, A.LSRQST_GEV_COGNOME, A.LSRQST_GEV_NOME, 
					A.LSRQST_GEV_NOTE, A.LSRQST_GEV_KEY_DATA_INS, A.LSRQST_GEV_KEY_ORA_INS,
					'', '',
					CASE A.LSRQST_GEV_FLAG_ANAG
					WHEN '0' THEN 'NON ABBINATO'
					WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
					ELSE 'ABBINATO TITOLARE PRECEDENTE'
					END
					ABBINAMENTO,
	
					CASE LSRASS_KEY_COD_ASS
					when  null then ''
					else LSRASS_KEY_COD_ASS
					end 
					associazione,
					LSRASS_DESCRIZIONE,
					'N' TIPOQST,

					B.lsrqst_GeV_tipo_esercizio,
					B.lsrqst_GeV_tipo_esercizio_note,
					B.lsrqst_GeV_cat_merc_primaria,
					B.lsrqst_GeV_cat_merc_primaria_note,
					B.lsrqst_GeV_cat_merc_secondaria,
					B.lsrqst_GeV_cat_merc_secondaria_note,
					B.lsrqst_GeV_punto_lottomatica,
					B.lsrqst_GeV_punto_Sisal,
					B.lsrqst_GeV_punto_Snai,
					B.lsrqst_GeV_punto_Lis,
					B.lsrqst_GeV_punto_note,
					B.lsrqst_Gev_associazione,
					B.lsrqst_GeV_presenza_lotto,
					B.lsrqst_GeV_presenza_superenalotto,
					B.lsrqst_GeV_presenza_totocalcio,
					B.lsrqst_GeV_presenza_totip,
					B.lsrqst_GeV_presenza_ippica,
					B.lsrqst_GeV_presenza_scommesse,
					B.lsrqst_GeV_presenza_vlt,
					B.lsrqst_GeV_presenza_servizi,
					B.lsrqst_Gev_prodotti_note,
					B.lsrqst_GeV_orario,
					B.lsrqst_GeV_giorno_riposo,
					B.lsrqst_GeV_num_vetrine,
					B.lsrqst_GeV_superficie,
					B.lsrqst_GeV_insegna_esterna,
					B.lsrqst_GeV_spazio_cliente,
					B.lsrqst_GeV_spazio_espositivo,
					B.lsrqst_GeV_tv,
					B.lsrqst_GeV_pc,
					B.lsrqst_GeV_stampante,
					B.lsrqst_GeV_internet,
					B.lsrqst_GeV_ubicazione,
					B.lsrqst_GeV_tipo_zona,
					B.lsrqst_GeV_posizione,
					B.lsrqst_GeV_tel_prinicipale,
					B.lsrqst_GeV_tel_alternativo,
					B.lsrqst_GeV_fax,
					B.lsrqst_GeV_e_mail
					
				FROM LSRQST_GEV  A left join LSRASS on LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE,
					LSRQST_GEV_new B
				WHERE A.LSRQST_GEV_COD_LOTTO = @CODLTM
				and B.LSRQST_GEV_COD_LOTTO = A.LSRQST_GEV_COD_LOTTO
				and B.lsrqst_GeV_key_data_ins = A.lsrqst_GeV_fk_data_ins_qst_new
				and B.lsrqst_GeV_key_ora_ins = A.lsrqst_GeV_fk_ora_ins_qst_new
				AND A.LSRQST_GEV_FK_DATA_INS_TIT_GEV IS NULL
				AND A.LSRQST_GEV_FK_ORA_INS_TIT_GEV IS NULL
				--AND LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE

			
		END
		ELSE -- @FKDATAINS not null
		begin
			select @APPO = null
			select @APPO = LSRQST_GEV_FK_DATA_INS_QST_NEW 
			from lsrqst_gev
			where 	LSRQST_GEV_COD_LOTTO = @CODLTM
				AND LSRQST_GEV_FK_DATA_INS_TIT_GEV  = @FKDATAINS
			AND LSRQST_GEV_FK_ORA_INS_TIT_GEV = @FKORAINS


			if @APPO IS null
			-- VECCHIO QUESTIONARIO
				SELECT  LSRQST_GEV_DATA_DOCUMENTO, LSRQST_GEV_DATA_INVIO_DOC, LSRQST_GEV_FLAG_ANAG,
					LSRQST_GEV_NUM_PROT_DOC, LSRQST_GEV_COGNOME, LSRQST_GEV_NOME, 
					LSRQST_GEV_NOTE, LSRQST_GEV_KEY_DATA_INS, LSRQST_GEV_KEY_ORA_INS,
					LSRTIT_CONI_COGNOME, LSRTIT_CONI_NOME,
					CASE LSRQST_GEV_FLAG_ANAG
					WHEN '0' THEN 'NON ABBINATO'
					WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
					ELSE 'ABBINATO TITOLARE PRECEDENTE'
					END
					ABBINAMENTO,
	
					CASE LSRASS_KEY_COD_ASS
					when  null then ''
					else LSRASS_KEY_COD_ASS
					end 
					associazione,
					LSRASS_DESCRIZIONE,
					'V' TIPOQST,
			
					LSRQST_GEV_TIPO_ESERCIZIO,
					LSRQST_GEV_ANNO_INIZIO,
					LSRQST_GEV_ORARIO,
					LSRQST_GEV_GIORNO_RIPOSO,
					LSRQST_GEV_NUM_VETRINE,
					LSRQST_GEV_SUPERFICIE,
					LSRQST_GEV_INSEGNA_ESTERNA,
					LSRQST_GEV_SPAZIO_CLIENTE,
					LSRQST_GEV_SPAZIO_ESPOSITIVO,
					LSRQST_GEV_SPAZIO_ESPOSITORI,
					LSRQST_GEV_PRESENZA_SUPERENALOTTO,
					LSRQST_GEV_PRESENZA_TOTOCALCIO,
					LSRQST_GEV_PRESENZA_TOTIP,
					LSRQST_GEV_PRESENZA_TRIS,
					LSRQST_GEV_PRESENZA_F101,
					LSRQST_GEV_PRESENZA_GEV,
					LSRQST_GEV_INCASSO_GEV,
					LSRQST_GEV_PC,
					LSRQST_GEV_STAMPANTE,
					LSRQST_GEV_INTERNET,
					LSRQST_GEV_UBICAZIONE,
					LSRQST_GEV_VICINO_A,
					LSRQST_GEV_TEL_PRINICIPALE,
					LSRQST_GEV_TEL_ALTERNATIVO,
					LSRQST_GEV_FAX,
					LSRQST_GEV_E_MAIL
			
				FROM LSRQST_GEV left join LSRASS on LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE, 
					LSRTIT_CONI
				WHERE LSRQST_GEV_COD_LOTTO = @CODLTM
				AND LSRQST_GEV_FK_DATA_INS_TIT_GEV = @FKDATAINS
				AND LSRQST_GEV_FK_ORA_INS_TIT_GEV = @FKORAINS
				--AND LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE
				AND LSRTIT_CONI_KEY_ID_RICEV = @CODLTM
				AND LSRTIT_CONI_KEY_DATA_INS = @FKDATAINS
				AND LSRTIT_CONI_KEY_ORA_INS = @FKORAINS
			else
				-- PRENDO I DATI DEL NUOVO QUESTIONARIO
				SELECT  LSRQST_GEV_DATA_DOCUMENTO, LSRQST_GEV_DATA_INVIO_DOC, LSRQST_GEV_FLAG_ANAG,
					LSRQST_GEV_NUM_PROT_DOC, LSRQST_GEV_COGNOME, LSRQST_GEV_NOME, 
					LSRQST_GEV_NOTE, A.LSRQST_GEV_KEY_DATA_INS, A.LSRQST_GEV_KEY_ORA_INS,
					LSRTIT_CONI_COGNOME, LSRTIT_CONI_NOME,
					CASE LSRQST_GEV_FLAG_ANAG
					WHEN '0' THEN 'NON ABBINATO'
					WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
					ELSE 'ABBINATO TITOLARE PRECEDENTE'
					END
					ABBINAMENTO,
	
					CASE LSRASS_KEY_COD_ASS
					when  null then ''
					else LSRASS_KEY_COD_ASS
					end 
					associazione,
					LSRASS_DESCRIZIONE,
					'N' TIPOQST,
	
					B.lsrqst_GeV_tipo_esercizio,
					B.lsrqst_GeV_tipo_esercizio_note,
					B.lsrqst_GeV_cat_merc_primaria,
					B.lsrqst_GeV_cat_merc_primaria_note,
					B.lsrqst_GeV_cat_merc_secondaria,
					B.lsrqst_GeV_cat_merc_secondaria_note,
					B.lsrqst_GeV_punto_lottomatica,
					B.lsrqst_GeV_punto_Sisal,
					B.lsrqst_GeV_punto_Snai,
					B.lsrqst_GeV_punto_Lis,
					B.lsrqst_GeV_punto_note,
					B.lsrqst_Gev_associazione,
					B.lsrqst_GeV_presenza_lotto,
					B.lsrqst_GeV_presenza_superenalotto,
					B.lsrqst_GeV_presenza_totocalcio,
					B.lsrqst_GeV_presenza_totip,
					B.lsrqst_GeV_presenza_ippica,
					B.lsrqst_GeV_presenza_scommesse,
					B.lsrqst_GeV_presenza_vlt,
					B.lsrqst_GeV_presenza_servizi,
					B.lsrqst_Gev_prodotti_note,
					B.lsrqst_GeV_orario,
					B.lsrqst_GeV_giorno_riposo,
					B.lsrqst_GeV_num_vetrine,
					B.lsrqst_GeV_superficie,
					B.lsrqst_GeV_insegna_esterna,
					B.lsrqst_GeV_spazio_cliente,
					B.lsrqst_GeV_spazio_espositivo,
					B.lsrqst_GeV_tv,
					B.lsrqst_GeV_pc,
					B.lsrqst_GeV_stampante,
					B.lsrqst_GeV_internet,
					B.lsrqst_GeV_ubicazione,
					B.lsrqst_GeV_tipo_zona,
					B.lsrqst_GeV_posizione,
					B.lsrqst_GeV_tel_prinicipale,
					B.lsrqst_GeV_tel_alternativo,
					B.lsrqst_GeV_fax,
					B.lsrqst_GeV_e_mail
					
				FROM LSRQST_GEV  A left join LSRASS on LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE,
					LSRQST_GEV_new B, LSRTIT_CONI
				WHERE A.LSRQST_GEV_COD_LOTTO = @CODLTM
				and B.LSRQST_GEV_COD_LOTTO = A.LSRQST_GEV_COD_LOTTO
				and B.lsrqst_GeV_key_data_ins = A.lsrqst_GeV_fk_data_ins_qst_new
				and B.lsrqst_GeV_key_ora_ins = A.lsrqst_GeV_fk_ora_ins_qst_new
				AND LSRQST_GEV_FK_DATA_INS_TIT_GEV = @FKDATAINS
				AND LSRQST_GEV_FK_ORA_INS_TIT_GEV = @FKORAINS
				--AND LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE
				AND LSRTIT_CONI_KEY_ID_RICEV = @CODLTM
				AND LSRTIT_CONI_KEY_DATA_INS = @FKDATAINS
				AND LSRTIT_CONI_KEY_ORA_INS = @FKORAINS
			
		end
	END
/*	
	IF @TIPODOC = 'QUN'
	BEGIN
		IF @FKDATAINS IS null
			SELECT  A.LSRQST_GEV_DATA_DOCUMENTO, A.LSRQST_GEV_DATA_INVIO_DOC, A.LSRQST_GEV_FLAG_ANAG,
				A.LSRQST_GEV_NUM_PROT_DOC, A.LSRQST_GEV_COGNOME, A.LSRQST_GEV_NOME, 
				A.LSRQST_GEV_NOTE, A.LSRQST_GEV_KEY_DATA_INS, A.LSRQST_GEV_KEY_ORA_INS,
				'', '',
				CASE A.LSRQST_GEV_FLAG_ANAG
				WHEN '0' THEN 'NON ABBINATO'
				WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
				ELSE 'ABBINATO TITOLARE PRECEDENTE'
				END
				ABBINAMENTO,

				CASE LSRASS_KEY_COD_ASS
				when  null then ''
				else LSRASS_KEY_COD_ASS
				end 
				associazione,
				LSRASS_DESCRIZIONE,

				B.lsrqst_GeV_tipo_esercizio,
				B.lsrqst_GeV_tipo_esercizio_note,
				B.lsrqst_GeV_cat_merc_primaria,
				B.lsrqst_GeV_cat_merc_primaria_note,
				B.lsrqst_GeV_cat_merc_secondaria,
				B.lsrqst_GeV_cat_merc_secondaria_note,
				B.lsrqst_GeV_punto_lottomatica,
				B.lsrqst_GeV_punto_Sisal,
				B.lsrqst_GeV_punto_Snai,
				B.lsrqst_GeV_punto_Lis,
				B.lsrqst_GeV_punto_note,
				B.lsrqst_Gev_associazione,
				B.lsrqst_GeV_presenza_lotto,
				B.lsrqst_GeV_presenza_superenalotto,
				B.lsrqst_GeV_presenza_totocalcio,
				B.lsrqst_GeV_presenza_totip,
				B.lsrqst_GeV_presenza_ippica,
				B.lsrqst_GeV_presenza_scommesse,
				B.lsrqst_GeV_presenza_vlt,
				B.lsrqst_GeV_presenza_servizi,
				B.lsrqst_Gev_prodotti_note,
				B.lsrqst_GeV_orario,
				B.lsrqst_GeV_giorno_riposo,
				B.lsrqst_GeV_num_vetrine,
				B.lsrqst_GeV_superficie,
				B.lsrqst_GeV_insegna_esterna,
				B.lsrqst_GeV_spazio_cliente,
				B.lsrqst_GeV_spazio_espositivo,
				B.lsrqst_GeV_tv,
				B.lsrqst_GeV_pc,
				B.lsrqst_GeV_stampante,
				B.lsrqst_GeV_internet,
				B.lsrqst_GeV_ubicazione,
				B.lsrqst_GeV_tipo_zona,
				B.lsrqst_GeV_posizione,
				B.lsrqst_GeV_tel_prinicipale,
				B.lsrqst_GeV_tel_alternativo,
				B.lsrqst_GeV_fax,
				B.lsrqst_GeV_e_mail
				
			FROM LSRQST_GEV  A left join LSRASS on LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE,
				LSRQST_GEV_new B
			WHERE A.LSRQST_GEV_COD_LOTTO = @CODLTM
			and B.LSRQST_GEV_COD_LOTTO = A.LSRQST_GEV_COD_LOTTO
			and B.lsrqst_GeV_key_data_ins = A.lsrqst_GeV_fk_data_ins_qst_new
			and B.lsrqst_GeV_key_ora_ins = A.lsrqst_GeV_fk_ora_ins_qst_new
			AND A.LSRQST_GEV_FK_DATA_INS_TIT_GEV IS NULL
			AND A.LSRQST_GEV_FK_ORA_INS_TIT_GEV IS NULL
			--AND LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE



		ELSE

			SELECT  LSRQST_GEV_DATA_DOCUMENTO, LSRQST_GEV_DATA_INVIO_DOC, LSRQST_GEV_FLAG_ANAG,
				LSRQST_GEV_NUM_PROT_DOC, LSRQST_GEV_COGNOME, LSRQST_GEV_NOME, 
				LSRQST_GEV_NOTE, A.LSRQST_GEV_KEY_DATA_INS, A.LSRQST_GEV_KEY_ORA_INS,
				LSRTIT_CONI_COGNOME, LSRTIT_CONI_NOME,
				CASE LSRQST_GEV_FLAG_ANAG
				WHEN '0' THEN 'NON ABBINATO'
				WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
				ELSE 'ABBINATO TITOLARE PRECEDENTE'
				END
				ABBINAMENTO,

				CASE LSRASS_KEY_COD_ASS
				when  null then ''
				else LSRASS_KEY_COD_ASS
				end 
				associazione,
				LSRASS_DESCRIZIONE,


				B.lsrqst_GeV_tipo_esercizio,
				B.lsrqst_GeV_tipo_esercizio_note,
				B.lsrqst_GeV_cat_merc_primaria,
				B.lsrqst_GeV_cat_merc_primaria_note,
				B.lsrqst_GeV_cat_merc_secondaria,
				B.lsrqst_GeV_cat_merc_secondaria_note,
				B.lsrqst_GeV_punto_lottomatica,
				B.lsrqst_GeV_punto_Sisal,
				B.lsrqst_GeV_punto_Snai,
				B.lsrqst_GeV_punto_Lis,
				B.lsrqst_GeV_punto_note,
				B.lsrqst_Gev_associazione,
				B.lsrqst_GeV_presenza_lotto,
				B.lsrqst_GeV_presenza_superenalotto,
				B.lsrqst_GeV_presenza_totocalcio,
				B.lsrqst_GeV_presenza_totip,
				B.lsrqst_GeV_presenza_ippica,
				B.lsrqst_GeV_presenza_scommesse,
				B.lsrqst_GeV_presenza_vlt,
				B.lsrqst_GeV_presenza_servizi,
				B.lsrqst_Gev_prodotti_note,
				B.lsrqst_GeV_orario,
				B.lsrqst_GeV_giorno_riposo,
				B.lsrqst_GeV_num_vetrine,
				B.lsrqst_GeV_superficie,
				B.lsrqst_GeV_insegna_esterna,
				B.lsrqst_GeV_spazio_cliente,
				B.lsrqst_GeV_spazio_espositivo,
				B.lsrqst_GeV_tv,
				B.lsrqst_GeV_pc,
				B.lsrqst_GeV_stampante,
				B.lsrqst_GeV_internet,
				B.lsrqst_GeV_ubicazione,
				B.lsrqst_GeV_tipo_zona,
				B.lsrqst_GeV_posizione,
				B.lsrqst_GeV_tel_prinicipale,
				B.lsrqst_GeV_tel_alternativo,
				B.lsrqst_GeV_fax,
				B.lsrqst_GeV_e_mail
				
			FROM LSRQST_GEV  A left join LSRASS on LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE,
				LSRQST_GEV_new B, LSRTIT_CONI
			WHERE A.LSRQST_GEV_COD_LOTTO = @CODLTM
			and B.LSRQST_GEV_COD_LOTTO = A.LSRQST_GEV_COD_LOTTO
			and B.lsrqst_GeV_key_data_ins = A.lsrqst_GeV_fk_data_ins_qst_new
			and B.lsrqst_GeV_key_ora_ins = A.lsrqst_GeV_fk_ora_ins_qst_new
			AND LSRQST_GEV_FK_DATA_INS_TIT_GEV = @FKDATAINS
			AND LSRQST_GEV_FK_ORA_INS_TIT_GEV = @FKORAINS
			--AND LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE
			AND LSRTIT_CONI_KEY_ID_RICEV = @CODLTM
			AND LSRTIT_CONI_KEY_DATA_INS = @FKDATAINS
			AND LSRTIT_CONI_KEY_ORA_INS = @FKORAINS

	END
*/
	IF @TIPODOC = 'FID'
	BEGIN
		IF @FKDATAINS IS null	
			SELECT LSRFID_GEV_DATA_DOCUMENTO, LSRFID_GEV_DATA_INVIO_DOC, LSRFID_GEV_FLAG_ANAG,
				LSRFID_GEV_NUM_PROT_DOC, LSRFID_GEV_COGNOME, LSRFID_GEV_NOME, LSRFID_GEV_NOTE, 
				LSRFID_GEV_KEY_DATA_INS,	LSRFID_GEV_KEY_ORA_INS, LSRFID_GEV_ANNO_RIF, 
				LSRFID_GEV_DATA_INIZIO, LSRFID_GEV_DATA_FINE,
				LSRFID_GEV_IMPORTO_PAGATO, LSRFID_GEV_IMPORTO_DOVUTO,
				'', '',
				CASE LSRFID_GEV_FLAG_ANAG
				WHEN '0' THEN 'NON ABBINATO'
				WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
				ELSE  'ABBINATO TITOLARE PRECEDENTE'
				END
				ABBINAMENTO,

				CASE LSRSOC_KEY_ID_SOC
				when  null then ''
				else LSRSOC_KEY_ID_SOC
				end 
				KEY_ID_SOC,
				LSRSOC_DESCRIZIONE

			FROM LSRFID_GEV left join LSRSOC on LSRFID_GEV_ID_SOC = LSRSOC_KEY_ID_SOC
			WHERE LSRFID_GEV_COD_LOTTO = @CODLTM
			AND LSRFID_GEV_FK_DATA_INS_TIT_GEV IS NULL
			AND LSRFID_GEV_FK_ORA_INS_TIT_GEV IS NULL
			--AND LSRFID_GEV_ID_SOC = LSRSOC_KEY_ID_SOC

		ELSE
	
			SELECT LSRFID_GEV_DATA_DOCUMENTO, LSRFID_GEV_DATA_INVIO_DOC, LSRFID_GEV_FLAG_ANAG,
				LSRFID_GEV_NUM_PROT_DOC, LSRFID_GEV_COGNOME, LSRFID_GEV_NOME, LSRFID_GEV_NOTE, 
				LSRFID_GEV_KEY_DATA_INS,	LSRFID_GEV_KEY_ORA_INS, LSRFID_GEV_ANNO_RIF, 
				LSRFID_GEV_DATA_INIZIO, LSRFID_GEV_DATA_FINE,
				LSRFID_GEV_IMPORTO_PAGATO, LSRFID_GEV_IMPORTO_DOVUTO,
				LSRTIT_CONI_COGNOME, LSRTIT_CONI_NOME,
				CASE LSRFID_GEV_FLAG_ANAG
				WHEN '0' THEN 'NON ABBINATO'
				WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
				ELSE  'ABBINATO TITOLARE PRECEDENTE'
				END
				ABBINAMENTO,

				CASE LSRSOC_KEY_ID_SOC
				when  null then ''
				else LSRSOC_KEY_ID_SOC
				end 
				KEY_ID_SOC,
				LSRSOC_DESCRIZIONE

			FROM LSRFID_GEV left join LSRSOC on LSRFID_GEV_ID_SOC = LSRSOC_KEY_ID_SOC, 
				LSRTIT_CONI
			WHERE LSRFID_GEV_COD_LOTTO = @CODLTM
			AND LSRFID_GEV_FK_DATA_INS_TIT_GEV = @FKDATAINS
			AND LSRFID_GEV_FK_ORA_INS_TIT_GEV = @FKORAINS
			--AND LSRFID_GEV_ID_SOC = LSRSOC_KEY_ID_SOC
			AND LSRTIT_CONI_KEY_ID_RICEV = @CODLTM
			AND LSRTIT_CONI_KEY_DATA_INS = @FKDATAINS
			AND LSRTIT_CONI_KEY_ORA_INS = @FKORAINS

	END
	
	IF @TIPODOC = 'RAD'
	BEGIN
		IF @FKDATAINS IS null	
	
			SELECT LSRRAD_DATA_DOC, LSRRAD_DATA_INVIO_DOC, LSRRAD_FLAG_ANAG,
				LSRRAD_NUM_PROT_DOC, LSRRAD_COGNOME, LSRRAD_NOME, 
				LSRRAD_NOTE, LSRRAD_KEY_DATA_INS, LSRRAD_KEY_ORA_INS,
				'', '',
				CASE LSRRAD_FLAG_ANAG
				WHEN '0' THEN 'NON ABBINATO'
				WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
				ELSE 'ABBINATO TITOLARE PRECEDENTE'
				END
				ABBINAMENTO,
				CASE LSRRAD_TIPO_MOVIMENTAZIONE
					WHEN 'A' THEN 'ATTIVAZIONE'
					WHEN 'R' THEN 'RIATTIVAZIONE'
					WHEN 'D' THEN 'DISATTIVAZIONE'
				END
				DESCMOVIMENTAZIONE,
				LSRRAD_TIPO_MOVIMENTAZIONE,
				CASE LSRRAD_FONTE
					WHEN 'LTM' THEN 'LOTTOMATICA'
					WHEN 'ASS' THEN 'ASSOCIAZIONE'
					WHEN 'NEW' THEN 'NEWCO'
					WHEN 'QUE' THEN 'QUESTURA'
				END
				DESCFONTE,
				LSRRAD_FONTE, LSRRAD_CAUSALE, LSRRAD_DATA_DECOR,

				CASE LSRASS_KEY_COD_ASS
				when  null then ''
				else LSRASS_KEY_COD_ASS
				end 
				associazione,
				LSRASS_DESCRIZIONE

				FROM LSRRAD_GEV left join LSRASS on LSRRAD_ASSOCIAZIONE = LSRASS_KEY_COD_ASS
				WHERE LSRRAD_COD_LOTTO = @CODLTM
				--AND LSRRAD_ASSOCIAZIONE = LSRASS_KEY_COD_ASS
				AND LSRRAD_FK_DATA_INS_TIT_GEV IS NULL
				AND LSRRAD_FK_ORA_INS_TIT_GEV IS NULL
				--AND LSRASS_KEY_COD_ASS = LSRRAD_ASSOCIAZIONE

		ELSE	

			SELECT LSRRAD_DATA_DOC, LSRRAD_DATA_INVIO_DOC, LSRRAD_FLAG_ANAG,
				LSRRAD_NUM_PROT_DOC, LSRRAD_COGNOME, LSRRAD_NOME, 
				LSRRAD_NOTE, LSRRAD_KEY_DATA_INS, LSRRAD_KEY_ORA_INS,
				LSRTIT_CONI_COGNOME, LSRTIT_CONI_NOME,
				CASE LSRRAD_FLAG_ANAG
				WHEN '0' THEN 'NON ABBINATO'
				WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
				ELSE 'ABBINATO TITOLARE PRECEDENTE'
				END
				ABBINAMENTO,
				CASE LSRRAD_TIPO_MOVIMENTAZIONE
					WHEN 'A' THEN 'ATTIVAZIONE'
					WHEN 'R' THEN 'RIATTIVAZIONE'
					WHEN 'D' THEN 'DISATTIVAZIONE'
				END
				DESCMOVIMENTAZIONE,
				LSRRAD_TIPO_MOVIMENTAZIONE,
				CASE LSRRAD_FONTE
					WHEN 'LTM' THEN 'LOTTOMATICA'
					WHEN 'ASS' THEN 'ASSOCIAZIONE'
					WHEN 'NEW' THEN 'NEWCO'
					WHEN 'QUE' THEN 'QUESTURA'
				END
				DESCFONTE,
				LSRRAD_FONTE, LSRRAD_CAUSALE, LSRRAD_DATA_DECOR,

				CASE LSRASS_KEY_COD_ASS
				when  null then ''
				else LSRASS_KEY_COD_ASS
				end 
				associazione,
				LSRASS_DESCRIZIONE

				FROM LSRRAD_GEV left join LSRASS on LSRRAD_ASSOCIAZIONE = LSRASS_KEY_COD_ASS,
					LSRTIT_CONI
				WHERE LSRRAD_COD_LOTTO = @CODLTM
				--AND LSRRAD_ASSOCIAZIONE = LSRASS_KEY_COD_ASS
				AND LSRRAD_FK_DATA_INS_TIT_GEV = @FKDATAINS
				AND LSRRAD_FK_ORA_INS_TIT_GEV = @FKORAINS
				--AND LSRASS_KEY_COD_ASS = LSRRAD_ASSOCIAZIONE
				AND LSRTIT_CONI_KEY_ID_RICEV = @CODLTM
				AND LSRTIT_CONI_KEY_DATA_INS = @FKDATAINS
				AND LSRTIT_CONI_KEY_ORA_INS = @FKORAINS

	END
	IF @TIPODOC = 'ITV'
	BEGIN

		IF @FKDATAINS IS null
		BEGIN	
			SELECT LSRCON_ITVM_DATA_DOCUMENTO, LSRCON_ITVM_DATA_INVIO_DOC, LSRCON_ITVM_DATA_CESSAZIONE,LSRCON_ITVM_DATA_LETTERA, LSRCON_ITVM_FLAG_ANAG,
				LSRCON_ITVM_NUM_PROT_DOC, LSRCON_ITVM_COGNOME, LSRCON_ITVM_NOME, 
				LSRCON_ITVM_NOTE, LSRCON_ITVM_KEY_DATA_INS, LSRCON_ITVM_KEY_ORA_INS,LSRCON_ITVM_FLAG_ANAG,
				CASE LSRCON_ITVM_FLAG_ANAG
				WHEN '0' THEN 'NON ABBINATO'
				WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
				WHEN '2' THEN 'ABBINATO TITOLARE PRECEDENTE'
				END
				ABBINAMENTO
				FROM LSRCON_ITVM 
				WHERE LSRCON_ITVM_COD_LOTTO = @CODLTM
				AND LSRCON_ITVM_FK_DATA_INS_TIT_GEV IS NULL
				AND LSRCON_ITVM_FK_ORA_INS_TIT_GEV IS NULL
		END
		ELSE
		BEGIN
			SELECT LSRCON_ITVM_DATA_DOCUMENTO, LSRCON_ITVM_DATA_INVIO_DOC, LSRCON_ITVM_DATA_CESSAZIONE, LSRCON_ITVM_DATA_LETTERA,LSRCON_ITVM_FLAG_ANAG,
				LSRCON_ITVM_NUM_PROT_DOC, LSRCON_ITVM_COGNOME, LSRCON_ITVM_NOME, 
				LSRCON_ITVM_NOTE, LSRCON_ITVM_KEY_DATA_INS, LSRCON_ITVM_KEY_ORA_INS,LSRCON_ITVM_FLAG_ANAG,
				CASE LSRCON_ITVM_FLAG_ANAG
				WHEN '0' THEN 'NON ABBINATO'
				WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
				WHEN '2' THEN 'ABBINATO TITOLARE PRECEDENTE'
				END
				ABBINAMENTO
				FROM LSRCON_ITVM , LSRTIT_CONI
				WHERE LSRCON_ITVM_COD_LOTTO = @CODLTM
				AND LSRCON_ITVM_FK_DATA_INS_TIT_GEV = @FKDATAINS
				AND LSRCON_ITVM_FK_ORA_INS_TIT_GEV = @FKORAINS
				AND LSRTIT_CONI_KEY_ID_RICEV = @CODLTM
				AND LSRTIT_CONI_KEY_DATA_INS = @FKDATAINS
				AND LSRTIT_CONI_KEY_ORA_INS = @FKORAINS
		END
	
		
	END


END
ELSE -- COD LOTTOMATICA ALFANUMERICO
BEGIN
	IF @TIPODOC = 'CON'
	BEGIN
		IF @FKDATAINS IS null

			SELECT  LSRCON_GEV_DATA_DOCUMENTO, LSRCON_GEV_DATA_INVIO_DOC, LSRCON_GEV_FLAG_ANAG,
				LSRCON_GEV_NUM_PROT_DOC, LSRCON_GEV_COGNOME, LSRCON_GEV_NOME, 
				LSRCON_GEV_NOTE, LSRCON_GEV_KEY_DATA_INS, LSRCON_GEV_KEY_ORA_INS,
				'', '',
				CASE LSRCON_GEV_FLAG_ANAG
				WHEN '0' THEN 'NON ABBINATO'
				WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
				WHEN '2' THEN 'ABBINATO TITOLARE PRECEDENTE'
				END
				ABBINAMENTO,

				CASE LSRASS_KEY_COD_ASS
				when  null then ''
				else LSRASS_KEY_COD_ASS
				end 
				associazione,
				LSRASS_DESCRIZIONE,

				lsrcon_GeV_comune_residenza,
				lsrcon_GeV_provincia_residenza,
				lsrcon_GeV_cap_residenza,
				lsrcon_GeV_indirizzo_residenza,

				lsrcon_GeV_comune_spedizione,
				lsrcon_GeV_provincia_spedizione,
				lsrcon_GeV_cap_spedizione,
				lsrcon_GeV_indirizzo_spedizione,
				lsrcon_GeV_referente_spedizione,

				lsrcon_GeV_telefono,
				lsrcon_GeV_cod_fisc,
				lsrcon_GeV_partita_iva,
				lsrcon_GeV_comune,
				lsrcon_GeV_provincia,
				lsrcon_GeV_cap,
				lsrcon_GeV_indirizzo,
				lsrcon_gev_numero_pacchi,
				lsrcon_gev_cod_merce,
				lsrcon_gev_email,
				LSRCON_GEV_FLAG_NUOVO_CON,
				LSRCON_GEV_DATA_NUOVO_CON

			FROM LSRCON_GEV left join LSRASS on LSRASS_KEY_COD_ASS = LSRCON_GEV_ASSOCIAZIONE
			WHERE LSRCON_GEV_COD_LOTTO = @CODLTM
			AND LSRCON_GEV_FK_DATA_INS_TIT IS NULL
			AND LSRCON_GEV_FK_ORA_INS_TIT IS NULL
			--AND LSRASS_KEY_COD_ASS = LSRCON_GEV_ASSOCIAZIONE
		ELSE
			SELECT  LSRCON_GEV_DATA_DOCUMENTO, LSRCON_GEV_DATA_INVIO_DOC, LSRCON_GEV_FLAG_ANAG,
				LSRCON_GEV_NUM_PROT_DOC, LSRCON_GEV_COGNOME, LSRCON_GEV_NOME, 
				LSRCON_GEV_NOTE, LSRCON_GEV_KEY_DATA_INS, LSRCON_GEV_KEY_ORA_INS,
				LSRTIT_COGNOME, LSRTIT_NOME,
				CASE LSRCON_GEV_FLAG_ANAG
				WHEN '0' THEN 'NON ABBINATO'
				WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
				ELSE  'ABBINATO TITOLARE PRECEDENTE'
				END
				ABBINAMENTO,

				CASE LSRASS_KEY_COD_ASS
				when  null then ''
				else LSRASS_KEY_COD_ASS
				end 
				associazione,
				LSRASS_DESCRIZIONE,

				lsrcon_GeV_comune_residenza,
				lsrcon_GeV_provincia_residenza,
				lsrcon_GeV_cap_residenza,
				lsrcon_GeV_indirizzo_residenza,

				lsrcon_GeV_comune_spedizione,
				lsrcon_GeV_provincia_spedizione,
				lsrcon_GeV_cap_spedizione,
				lsrcon_GeV_indirizzo_spedizione,
				lsrcon_GeV_referente_spedizione,

				lsrcon_GeV_telefono,
				lsrcon_GeV_cod_fisc,
				lsrcon_GeV_partita_iva,
				lsrcon_GeV_comune,
				lsrcon_GeV_provincia,
				lsrcon_GeV_cap,
				lsrcon_GeV_indirizzo,
				lsrcon_gev_numero_pacchi,
				lsrcon_gev_cod_merce,
				lsrcon_gev_email,
				LSRCON_GEV_FLAG_NUOVO_CON,
				LSRCON_GEV_DATA_NUOVO_CON

		
			FROM LSRCON_GEV left join LSRASS on LSRASS_KEY_COD_ASS = LSRCON_GEV_ASSOCIAZIONE,
				LSRTIT
			WHERE LSRCON_GEV_COD_LOTTO = @CODLTM
			AND LSRCON_GEV_FK_DATA_INS_TIT = @FKDATAINS
			AND LSRCON_GEV_FK_ORA_INS_TIT = @FKORAINS
			--AND LSRASS_KEY_COD_ASS = LSRCON_GEV_ASSOCIAZIONE
			AND LSRTIT_KEY_ID_RICEV = @CODLTM
			AND LSRTIT_KEY_DATA_INS = @FKDATAINS
			AND LSRTIT_KEY_ORA_INS = @FKORAINS
	END
	
	
	
	IF @TIPODOC = 'QUE'
	BEGIN
		IF @FKDATAINS IS null
		BEGIN

			select @APPO = null
			select @APPO = LSRQST_GEV_FK_DATA_INS_QST_NEW 
			from lsrqst_gev
			where 	LSRQST_GEV_COD_LOTTO = @CODLTM
				AND LSRQST_GEV_FK_DATA_INS_TIT IS NULL
				AND LSRQST_GEV_FK_ORA_INS_TIT IS NULL

			-- VECCHIO QUESTIONARIO
			if @APPO IS null	


				SELECT  LSRQST_GEV_DATA_DOCUMENTO, LSRQST_GEV_DATA_INVIO_DOC, LSRQST_GEV_FLAG_ANAG,
					LSRQST_GEV_NUM_PROT_DOC, LSRQST_GEV_COGNOME, LSRQST_GEV_NOME, 
					LSRQST_GEV_NOTE, LSRQST_GEV_KEY_DATA_INS, LSRQST_GEV_KEY_ORA_INS,
					'', '',
					CASE LSRQST_GEV_FLAG_ANAG
					WHEN '0' THEN 'NON ABBINATO'
					WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
					WHEN '2' THEN 'ABBINATO TITOLARE PRECEDENTE'
					END
					ABBINAMENTO,
	
					CASE LSRASS_KEY_COD_ASS
					when  null then ''
					else LSRASS_KEY_COD_ASS
					end 
					associazione,
					LSRASS_DESCRIZIONE,
					'V' TIPOQST,
			
					LSRQST_GEV_TIPO_ESERCIZIO,
					LSRQST_GEV_ANNO_INIZIO,
					LSRQST_GEV_ORARIO,
					LSRQST_GEV_GIORNO_RIPOSO,
					LSRQST_GEV_NUM_VETRINE,
					LSRQST_GEV_SUPERFICIE,
					LSRQST_GEV_INSEGNA_ESTERNA,
					LSRQST_GEV_SPAZIO_CLIENTE,
					LSRQST_GEV_SPAZIO_ESPOSITIVO,
					LSRQST_GEV_SPAZIO_ESPOSITORI,
					LSRQST_GEV_PRESENZA_SUPERENALOTTO,
					LSRQST_GEV_PRESENZA_TOTOCALCIO,
					LSRQST_GEV_PRESENZA_TOTIP,
					LSRQST_GEV_PRESENZA_TRIS,
					LSRQST_GEV_PRESENZA_F101,
					LSRQST_GEV_PRESENZA_GEV,
					LSRQST_GEV_INCASSO_GEV,
					LSRQST_GEV_PC,
					LSRQST_GEV_STAMPANTE,
					LSRQST_GEV_INTERNET,
					LSRQST_GEV_UBICAZIONE,
					LSRQST_GEV_VICINO_A,
					LSRQST_GEV_TEL_PRINICIPALE,
					LSRQST_GEV_TEL_ALTERNATIVO,
					LSRQST_GEV_FAX,
					LSRQST_GEV_E_MAIL
		
			
				FROM LSRQST_GEV left join LSRASS on LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE
				WHERE LSRQST_GEV_COD_LOTTO = @CODLTM
				AND LSRQST_GEV_FK_DATA_INS_TIT IS NULL
				AND LSRQST_GEV_FK_ORA_INS_TIT IS NULL
				--AND LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE
			else

				--NUOVO QUESTIONARIO
				SELECT  A.LSRQST_GEV_DATA_DOCUMENTO, A.LSRQST_GEV_DATA_INVIO_DOC, A.LSRQST_GEV_FLAG_ANAG,
					A.LSRQST_GEV_NUM_PROT_DOC, A.LSRQST_GEV_COGNOME, A.LSRQST_GEV_NOME, 
					A.LSRQST_GEV_NOTE, A.LSRQST_GEV_KEY_DATA_INS, A.LSRQST_GEV_KEY_ORA_INS,
					'', '',
					CASE A.LSRQST_GEV_FLAG_ANAG
					WHEN '0' THEN 'NON ABBINATO'
					WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
					ELSE 'ABBINATO TITOLARE PRECEDENTE'
					END
					ABBINAMENTO,
	
					CASE LSRASS_KEY_COD_ASS
					when  null then ''
					else LSRASS_KEY_COD_ASS
					end 
					associazione,
					LSRASS_DESCRIZIONE,
					'N' TIPOQST,
	
					B.lsrqst_GeV_tipo_esercizio,
					B.lsrqst_GeV_tipo_esercizio_note,
					B.lsrqst_GeV_cat_merc_primaria,
					B.lsrqst_GeV_cat_merc_primaria_note,
					B.lsrqst_GeV_cat_merc_secondaria,
					B.lsrqst_GeV_cat_merc_secondaria_note,
					B.lsrqst_GeV_punto_lottomatica,
					B.lsrqst_GeV_punto_Sisal,
					B.lsrqst_GeV_punto_Snai,
					B.lsrqst_GeV_punto_Lis,
					B.lsrqst_GeV_punto_note,
					B.lsrqst_Gev_associazione,
					B.lsrqst_GeV_presenza_lotto,
					B.lsrqst_GeV_presenza_superenalotto,
					B.lsrqst_GeV_presenza_totocalcio,
					B.lsrqst_GeV_presenza_totip,
					B.lsrqst_GeV_presenza_ippica,
					B.lsrqst_GeV_presenza_scommesse,
					B.lsrqst_GeV_presenza_vlt,
					B.lsrqst_GeV_presenza_servizi,
					B.lsrqst_Gev_prodotti_note,
					B.lsrqst_GeV_orario,
					B.lsrqst_GeV_giorno_riposo,
					B.lsrqst_GeV_num_vetrine,
					B.lsrqst_GeV_superficie,
					B.lsrqst_GeV_insegna_esterna,
					B.lsrqst_GeV_spazio_cliente,
					B.lsrqst_GeV_spazio_espositivo,
					B.lsrqst_GeV_tv,
					B.lsrqst_GeV_pc,
					B.lsrqst_GeV_stampante,
					B.lsrqst_GeV_internet,
					B.lsrqst_GeV_ubicazione,
					B.lsrqst_GeV_tipo_zona,
					B.lsrqst_GeV_posizione,
					B.lsrqst_GeV_tel_prinicipale,
					B.lsrqst_GeV_tel_alternativo,
					B.lsrqst_GeV_fax,
					B.lsrqst_GeV_e_mail
					
				FROM LSRQST_GEV  A left join LSRASS on LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE,
					LSRQST_GEV_new B
				WHERE A.LSRQST_GEV_COD_LOTTO = @CODLTM
				and B.LSRQST_GEV_COD_LOTTO = A.LSRQST_GEV_COD_LOTTO
				and B.lsrqst_GeV_key_data_ins = A.lsrqst_GeV_fk_data_ins_qst_new
				and B.lsrqst_GeV_key_ora_ins = A.lsrqst_GeV_fk_ora_ins_qst_new				
				AND A.LSRQST_GEV_FK_DATA_INS_TIT IS NULL
				AND A.LSRQST_GEV_FK_ORA_INS_TIT IS NULL
				--AND LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE


		END
		ELSE
		BEGIN

			select @APPO = null
			select @APPO = LSRQST_GEV_FK_DATA_INS_QST_NEW 
			from lsrqst_gev
			where 	LSRQST_GEV_COD_LOTTO = @CODLTM
				AND LSRQST_GEV_FK_DATA_INS_TIT  = @FKDATAINS
			AND LSRQST_GEV_FK_ORA_INS_TIT = @FKORAINS

			if @APPO IS null
				-- VECCHIO QUESTIONARIO
	
				SELECT  LSRQST_GEV_DATA_DOCUMENTO, LSRQST_GEV_DATA_INVIO_DOC, LSRQST_GEV_FLAG_ANAG,
					LSRQST_GEV_NUM_PROT_DOC, LSRQST_GEV_COGNOME, LSRQST_GEV_NOME, 
					LSRQST_GEV_NOTE, LSRQST_GEV_KEY_DATA_INS, LSRQST_GEV_KEY_ORA_INS,
					LSRTIT_COGNOME, LSRTIT_NOME,
					CASE LSRQST_GEV_FLAG_ANAG
					WHEN '0' THEN 'NON ABBINATO'
					WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
					WHEN '2' THEN 'ABBINATO TITOLARE PRECEDENTE'
					END
					ABBINAMENTO,
					
					CASE LSRASS_KEY_COD_ASS
					when  null then ''
					else LSRASS_KEY_COD_ASS
					end 
					associazione,
					LSRASS_DESCRIZIONE,
					'V' TIPOQST,
			
					LSRQST_GEV_TIPO_ESERCIZIO,
					LSRQST_GEV_ANNO_INIZIO,
					LSRQST_GEV_ORARIO,
					LSRQST_GEV_GIORNO_RIPOSO,
					LSRQST_GEV_NUM_VETRINE,
					LSRQST_GEV_SUPERFICIE,
					LSRQST_GEV_INSEGNA_ESTERNA,
					LSRQST_GEV_SPAZIO_CLIENTE,
					LSRQST_GEV_SPAZIO_ESPOSITIVO,
					LSRQST_GEV_SPAZIO_ESPOSITORI,
					LSRQST_GEV_PRESENZA_SUPERENALOTTO,
					LSRQST_GEV_PRESENZA_TOTOCALCIO,
					LSRQST_GEV_PRESENZA_TOTIP,
					LSRQST_GEV_PRESENZA_TRIS,
					LSRQST_GEV_PRESENZA_F101,
					LSRQST_GEV_PRESENZA_GEV,
					LSRQST_GEV_INCASSO_GEV,
					LSRQST_GEV_PC,
					LSRQST_GEV_STAMPANTE,
					LSRQST_GEV_INTERNET,
					LSRQST_GEV_UBICAZIONE,
					LSRQST_GEV_VICINO_A,
					LSRQST_GEV_TEL_PRINICIPALE,
					LSRQST_GEV_TEL_ALTERNATIVO,
					LSRQST_GEV_FAX,
					LSRQST_GEV_E_MAIL
		
			
				FROM LSRQST_GEV left join LSRASS on LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE,
					 LSRTIT
				WHERE LSRQST_GEV_COD_LOTTO = @CODLTM
				AND LSRQST_GEV_FK_DATA_INS_TIT = @FKDATAINS
				AND LSRQST_GEV_FK_ORA_INS_TIT = @FKORAINS
	--			AND LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE
				AND LSRTIT_KEY_ID_RICEV = @CODLTM
				AND LSRTIT_KEY_DATA_INS = @FKDATAINS
				AND LSRTIT_KEY_ORA_INS = @FKORAINS

			else
			--NUOVO QUESTIONARIO

				SELECT  LSRQST_GEV_DATA_DOCUMENTO, LSRQST_GEV_DATA_INVIO_DOC, LSRQST_GEV_FLAG_ANAG,
				LSRQST_GEV_NUM_PROT_DOC, LSRQST_GEV_COGNOME, LSRQST_GEV_NOME, 
				LSRQST_GEV_NOTE, A.LSRQST_GEV_KEY_DATA_INS, A.LSRQST_GEV_KEY_ORA_INS,
				LSRTIT_COGNOME, LSRTIT_NOME,
				CASE LSRQST_GEV_FLAG_ANAG
				WHEN '0' THEN 'NON ABBINATO'
				WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
				ELSE 'ABBINATO TITOLARE PRECEDENTE'
				END
				ABBINAMENTO,

				CASE LSRASS_KEY_COD_ASS
				when  null then ''
				else LSRASS_KEY_COD_ASS
				end 
				associazione,
				LSRASS_DESCRIZIONE,
				'N' TIPOQST,

				B.lsrqst_GeV_tipo_esercizio,
				B.lsrqst_GeV_tipo_esercizio_note,
				B.lsrqst_GeV_cat_merc_primaria,
				B.lsrqst_GeV_cat_merc_primaria_note,
				B.lsrqst_GeV_cat_merc_secondaria,
				B.lsrqst_GeV_cat_merc_secondaria_note,
				B.lsrqst_GeV_punto_lottomatica,
				B.lsrqst_GeV_punto_Sisal,
				B.lsrqst_GeV_punto_Snai,
				B.lsrqst_GeV_punto_Lis,

				B.lsrqst_GeV_punto_note,
				B.lsrqst_Gev_associazione,
				B.lsrqst_GeV_presenza_lotto,
				B.lsrqst_GeV_presenza_superenalotto,
				B.lsrqst_GeV_presenza_totocalcio,
				B.lsrqst_GeV_presenza_totip,
				B.lsrqst_GeV_presenza_ippica,
				B.lsrqst_GeV_presenza_scommesse,
				B.lsrqst_GeV_presenza_vlt,
				B.lsrqst_GeV_presenza_servizi,
				B.lsrqst_Gev_prodotti_note,
				B.lsrqst_GeV_orario,
				B.lsrqst_GeV_giorno_riposo,
				B.lsrqst_GeV_num_vetrine,
				B.lsrqst_GeV_superficie,
				B.lsrqst_GeV_insegna_esterna,
				B.lsrqst_GeV_spazio_cliente,
				B.lsrqst_GeV_spazio_espositivo,
				B.lsrqst_GeV_tv,
				B.lsrqst_GeV_pc,
				B.lsrqst_GeV_stampante,
				B.lsrqst_GeV_internet,
				B.lsrqst_GeV_ubicazione,
				B.lsrqst_GeV_tipo_zona,
				B.lsrqst_GeV_posizione,
				B.lsrqst_GeV_tel_prinicipale,
				B.lsrqst_GeV_tel_alternativo,
				B.lsrqst_GeV_fax,
				B.lsrqst_GeV_e_mail
				
			FROM LSRQST_GEV  A left join LSRASS on LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE,
				LSRQST_GEV_new B, LSRTIT
			WHERE A.LSRQST_GEV_COD_LOTTO = @CODLTM
			and B.LSRQST_GEV_COD_LOTTO = A.LSRQST_GEV_COD_LOTTO
			and B.lsrqst_GeV_key_data_ins = A.lsrqst_GeV_fk_data_ins_qst_new
			and B.lsrqst_GeV_key_ora_ins = A.lsrqst_GeV_fk_ora_ins_qst_new
			AND LSRQST_GEV_FK_DATA_INS_TIT = @FKDATAINS
			AND LSRQST_GEV_FK_ORA_INS_TIT = @FKORAINS
			--AND LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE
			AND LSRTIT_KEY_ID_RICEV = @CODLTM
			AND LSRTIT_KEY_DATA_INS = @FKDATAINS
			AND LSRTIT_KEY_ORA_INS = @FKORAINS

		END
	END
/*
	IF @TIPODOC = 'QUN'
	BEGIN
		IF @FKDATAINS IS null
			SELECT  A.LSRQST_GEV_DATA_DOCUMENTO, A.LSRQST_GEV_DATA_INVIO_DOC, A.LSRQST_GEV_FLAG_ANAG,
				A.LSRQST_GEV_NUM_PROT_DOC, A.LSRQST_GEV_COGNOME, A.LSRQST_GEV_NOME, 
				A.LSRQST_GEV_NOTE, A.LSRQST_GEV_KEY_DATA_INS, A.LSRQST_GEV_KEY_ORA_INS,
				'', '',
				CASE A.LSRQST_GEV_FLAG_ANAG
				WHEN '0' THEN 'NON ABBINATO'
				WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
				ELSE 'ABBINATO TITOLARE PRECEDENTE'
				END
				ABBINAMENTO,

				CASE LSRASS_KEY_COD_ASS
				when  null then ''
				else LSRASS_KEY_COD_ASS
				end 
				associazione,
				LSRASS_DESCRIZIONE,

				B.lsrqst_GeV_tipo_esercizio,
				B.lsrqst_GeV_tipo_esercizio_note,
				B.lsrqst_GeV_cat_merc_primaria,
				B.lsrqst_GeV_cat_merc_primaria_note,
				B.lsrqst_GeV_cat_merc_secondaria,
				B.lsrqst_GeV_cat_merc_secondaria_note,
				B.lsrqst_GeV_punto_lottomatica,
				B.lsrqst_GeV_punto_Sisal,
				B.lsrqst_GeV_punto_Snai,
				B.lsrqst_GeV_punto_Lis,
				B.lsrqst_GeV_punto_note,
				B.lsrqst_Gev_associazione,
				B.lsrqst_GeV_presenza_lotto,
				B.lsrqst_GeV_presenza_superenalotto,
				B.lsrqst_GeV_presenza_totocalcio,
				B.lsrqst_GeV_presenza_totip,
				B.lsrqst_GeV_presenza_ippica,
				B.lsrqst_GeV_presenza_scommesse,
				B.lsrqst_GeV_presenza_vlt,
				B.lsrqst_GeV_presenza_servizi,
				B.lsrqst_Gev_prodotti_note,
				B.lsrqst_GeV_orario,
				B.lsrqst_GeV_giorno_riposo,
				B.lsrqst_GeV_num_vetrine,
				B.lsrqst_GeV_superficie,
				B.lsrqst_GeV_insegna_esterna,
				B.lsrqst_GeV_spazio_cliente,
				B.lsrqst_GeV_spazio_espositivo,
				B.lsrqst_GeV_tv,
				B.lsrqst_GeV_pc,
				B.lsrqst_GeV_stampante,
				B.lsrqst_GeV_internet,
				B.lsrqst_GeV_ubicazione,
				B.lsrqst_GeV_tipo_zona,
				B.lsrqst_GeV_posizione,
				B.lsrqst_GeV_tel_prinicipale,
				B.lsrqst_GeV_tel_alternativo,
				B.lsrqst_GeV_fax,
				B.lsrqst_GeV_e_mail
				
			FROM LSRQST_GEV  A left join LSRASS on LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE,
				LSRQST_GEV_new B
			WHERE A.LSRQST_GEV_COD_LOTTO = @CODLTM
			and B.LSRQST_GEV_COD_LOTTO = A.LSRQST_GEV_COD_LOTTO
			and B.lsrqst_GeV_key_data_ins = A.lsrqst_GeV_fk_data_ins_qst_new
			and B.lsrqst_GeV_key_ora_ins = A.lsrqst_GeV_fk_ora_ins_qst_new
			AND A.LSRQST_GEV_FK_DATA_INS_TIT IS NULL
			AND A.LSRQST_GEV_FK_ORA_INS_TIT IS NULL
			--AND LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE



		ELSE

			SELECT  LSRQST_GEV_DATA_DOCUMENTO, LSRQST_GEV_DATA_INVIO_DOC, LSRQST_GEV_FLAG_ANAG,
				LSRQST_GEV_NUM_PROT_DOC, LSRQST_GEV_COGNOME, LSRQST_GEV_NOME, 
				LSRQST_GEV_NOTE, A.LSRQST_GEV_KEY_DATA_INS, A.LSRQST_GEV_KEY_ORA_INS,
				LSRTIT_COGNOME, LSRTIT_NOME,
				CASE LSRQST_GEV_FLAG_ANAG
				WHEN '0' THEN 'NON ABBINATO'
				WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
				ELSE 'ABBINATO TITOLARE PRECEDENTE'
				END
				ABBINAMENTO,

				CASE LSRASS_KEY_COD_ASS
				when  null then ''
				else LSRASS_KEY_COD_ASS
				end 
				associazione,
				LSRASS_DESCRIZIONE,


				B.lsrqst_GeV_tipo_esercizio,
				B.lsrqst_GeV_tipo_esercizio_note,
				B.lsrqst_GeV_cat_merc_primaria,
				B.lsrqst_GeV_cat_merc_primaria_note,
				B.lsrqst_GeV_cat_merc_secondaria,
				B.lsrqst_GeV_cat_merc_secondaria_note,
				B.lsrqst_GeV_punto_lottomatica,
				B.lsrqst_GeV_punto_Sisal,
				B.lsrqst_GeV_punto_Snai,
				B.lsrqst_GeV_punto_Lis,

				B.lsrqst_GeV_punto_note,
				B.lsrqst_Gev_associazione,
				B.lsrqst_GeV_presenza_lotto,
				B.lsrqst_GeV_presenza_superenalotto,
				B.lsrqst_GeV_presenza_totocalcio,
				B.lsrqst_GeV_presenza_totip,
				B.lsrqst_GeV_presenza_ippica,
				B.lsrqst_GeV_presenza_scommesse,
				B.lsrqst_GeV_presenza_vlt,
				B.lsrqst_GeV_presenza_servizi,
				B.lsrqst_Gev_prodotti_note,
				B.lsrqst_GeV_orario,
				B.lsrqst_GeV_giorno_riposo,
				B.lsrqst_GeV_num_vetrine,
				B.lsrqst_GeV_superficie,
				B.lsrqst_GeV_insegna_esterna,
				B.lsrqst_GeV_spazio_cliente,
				B.lsrqst_GeV_spazio_espositivo,
				B.lsrqst_GeV_tv,
				B.lsrqst_GeV_pc,
				B.lsrqst_GeV_stampante,
				B.lsrqst_GeV_internet,
				B.lsrqst_GeV_ubicazione,
				B.lsrqst_GeV_tipo_zona,
				B.lsrqst_GeV_posizione,
				B.lsrqst_GeV_tel_prinicipale,
				B.lsrqst_GeV_tel_alternativo,
				B.lsrqst_GeV_fax,
				B.lsrqst_GeV_e_mail
				
			FROM LSRQST_GEV  A left join LSRASS on LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE,
				LSRQST_GEV_new B, LSRTIT
			WHERE A.LSRQST_GEV_COD_LOTTO = @CODLTM
			and B.LSRQST_GEV_COD_LOTTO = A.LSRQST_GEV_COD_LOTTO
			and B.lsrqst_GeV_key_data_ins = A.lsrqst_GeV_fk_data_ins_qst_new
			and B.lsrqst_GeV_key_ora_ins = A.lsrqst_GeV_fk_ora_ins_qst_new
			AND LSRQST_GEV_FK_DATA_INS_TIT_GEV = @FKDATAINS
			AND LSRQST_GEV_FK_ORA_INS_TIT_GEV = @FKORAINS
			--AND LSRASS_KEY_COD_ASS = LSRQST_GEV_ASSOCIAZIONE
			AND LSRTIT_KEY_ID_RICEV = @CODLTM
			AND LSRTIT_KEY_DATA_INS = @FKDATAINS
			AND LSRTIT_KEY_ORA_INS = @FKORAINS

	END

*/
	
	IF @TIPODOC = 'FID'
	BEGIN
	
		IF @FKDATAINS IS null
		BEGIN
			SELECT LSRFID_GEV_DATA_DOCUMENTO, LSRFID_GEV_DATA_INVIO_DOC, LSRFID_GEV_FLAG_ANAG,
				LSRFID_GEV_NUM_PROT_DOC, LSRFID_GEV_COGNOME, LSRFID_GEV_NOME, LSRFID_GEV_NOTE, 
				LSRFID_GEV_KEY_DATA_INS,	LSRFID_GEV_KEY_ORA_INS, LSRFID_GEV_ANNO_RIF, 
				LSRFID_GEV_DATA_INIZIO, LSRFID_GEV_DATA_FINE,
				LSRFID_GEV_IMPORTO_PAGATO, LSRFID_GEV_IMPORTO_DOVUTO,
				'', '',
				CASE LSRFID_GEV_FLAG_ANAG
				WHEN '0' THEN 'NON ABBINATO'
				WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
				WHEN '2' THEN 'ABBINATO TITOLARE PRECEDENTE'
				END
				ABBINAMENTO,

				CASE LSRSOC_KEY_ID_SOC
				when  null then ''
				else LSRSOC_KEY_ID_SOC
				end 
				KEY_ID_SOC,
				LSRSOC_DESCRIZIONE

			FROM LSRFID_GEV left join LSRSOC on LSRFID_GEV_ID_SOC = LSRSOC_KEY_ID_SOC
			WHERE LSRFID_GEV_COD_LOTTO = @CODLTM
			AND LSRFID_GEV_FK_DATA_INS_TIT IS NULL
			AND LSRFID_GEV_FK_ORA_INS_TIT IS NULL
			--AND LSRFID_GEV_ID_SOC = LSRSOC_KEY_ID_SOC
			
		END
		ELSE
		BEGIN
			SELECT LSRFID_GEV_DATA_DOCUMENTO, LSRFID_GEV_DATA_INVIO_DOC, LSRFID_GEV_FLAG_ANAG,
				LSRFID_GEV_NUM_PROT_DOC, LSRFID_GEV_COGNOME, LSRFID_GEV_NOME, LSRFID_GEV_NOTE, 
				LSRFID_GEV_KEY_DATA_INS,	LSRFID_GEV_KEY_ORA_INS, LSRFID_GEV_ANNO_RIF, 
				LSRFID_GEV_DATA_INIZIO, LSRFID_GEV_DATA_FINE,
				LSRFID_GEV_IMPORTO_PAGATO, LSRFID_GEV_IMPORTO_DOVUTO,
				LSRTIT_COGNOME, LSRTIT_NOME,
				CASE LSRFID_GEV_FLAG_ANAG
				WHEN '0' THEN 'NON ABBINATO'
				WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
				WHEN '2' THEN 'ABBINATO TITOLARE PRECEDENTE'
				END
				ABBINAMENTO,

				CASE LSRSOC_KEY_ID_SOC
				when  null then ''
				else LSRSOC_KEY_ID_SOC
				end 
				KEY_ID_SOC,
				LSRSOC_DESCRIZIONE

			FROM LSRFID_GEV left join LSRSOC on LSRFID_GEV_ID_SOC = LSRSOC_KEY_ID_SOC,
				LSRTIT
			WHERE LSRFID_GEV_COD_LOTTO = @CODLTM
			AND LSRFID_GEV_FK_DATA_INS_TIT = @FKDATAINS
			AND LSRFID_GEV_FK_ORA_INS_TIT = @FKORAINS
			--AND LSRFID_GEV_ID_SOC = LSRSOC_KEY_ID_SOC
			AND LSRTIT_KEY_ID_RICEV = @CODLTM
			AND LSRTIT_KEY_DATA_INS = @FKDATAINS
			AND LSRTIT_KEY_ORA_INS = @FKORAINS

		END
	
	END
	
	IF @TIPODOC = 'RAD'
	BEGIN

		IF @FKDATAINS IS null
		BEGIN	
			SELECT LSRRAD_DATA_DOC, LSRRAD_DATA_INVIO_DOC, LSRRAD_FLAG_ANAG,
				LSRRAD_NUM_PROT_DOC, LSRRAD_COGNOME, LSRRAD_NOME, 
				LSRRAD_NOTE, LSRRAD_KEY_DATA_INS, LSRRAD_KEY_ORA_INS,
				'', '',
				CASE LSRRAD_FLAG_ANAG
				WHEN '0' THEN 'NON ABBINATO'
				WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
				WHEN '2' THEN 'ABBINATO TITOLARE PRECEDENTE'
				END
				ABBINAMENTO,
				CASE LSRRAD_TIPO_MOVIMENTAZIONE
					WHEN 'A' THEN 'ATTIVAZIONE'
					WHEN 'R' THEN 'RIATTIVAZIONE'
					WHEN 'D' THEN 'DISATTIVAZIONE'
				END
				DESCMOVIMENTAZIONE,
				LSRRAD_TIPO_MOVIMENTAZIONE,
				CASE LSRRAD_FONTE
					WHEN 'LTM' THEN 'LOTTOMATICA'
					WHEN 'ASS' THEN 'ASSOCIAZIONE'
					WHEN 'NEW' THEN 'NEWCO'
					WHEN 'QUE' THEN 'QUESTURA'
				END
				DESCFONTE,
				LSRRAD_FONTE, LSRRAD_CAUSALE, LSRRAD_DATA_DECOR,

				CASE LSRASS_KEY_COD_ASS
				when  null then ''
				else LSRASS_KEY_COD_ASS
				end 
				associazione,
				LSRASS_DESCRIZIONE

				FROM LSRRAD_GEV left join LSRASS on LSRASS_KEY_COD_ASS = LSRRAD_ASSOCIAZIONE
				WHERE LSRRAD_COD_LOTTO = @CODLTM
				--AND LSRRAD_ASSOCIAZIONE = LSRASS_KEY_COD_ASS
				AND LSRRAD_FK_DATA_INS_TIT IS NULL
				AND LSRRAD_FK_ORA_INS_TIT IS NULL
				--AND LSRASS_KEY_COD_ASS = LSRRAD_ASSOCIAZIONE
		END
		ELSE
		BEGIN
			SELECT LSRRAD_DATA_DOC, LSRRAD_DATA_INVIO_DOC, LSRRAD_FLAG_ANAG,
				LSRRAD_NUM_PROT_DOC, LSRRAD_COGNOME, LSRRAD_NOME, 
				LSRRAD_NOTE, LSRRAD_KEY_DATA_INS, LSRRAD_KEY_ORA_INS,
				LSRTIT_COGNOME, LSRTIT_NOME,
				CASE LSRRAD_FLAG_ANAG
				WHEN '0' THEN 'NON ABBINATO'
				WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
				WHEN '2' THEN 'ABBINATO TITOLARE PRECEDENTE'
				END
				ABBINAMENTO,
				CASE LSRRAD_TIPO_MOVIMENTAZIONE
					WHEN 'A' THEN 'ATTIVAZIONE'
					WHEN 'R' THEN 'RIATTIVAZIONE'
					WHEN 'D' THEN 'DISATTIVAZIONE'
				END
				DESCMOVIMENTAZIONE,
				LSRRAD_TIPO_MOVIMENTAZIONE,
				CASE LSRRAD_FONTE
					WHEN 'LTM' THEN 'LOTTOMATICA'
					WHEN 'ASS' THEN 'ASSOCIAZIONE'
					WHEN 'NEW' THEN 'NEWCO'
					WHEN 'QUE' THEN 'QUESTURA'
				END
				DESCFONTE,
				LSRRAD_FONTE, LSRRAD_CAUSALE, LSRRAD_DATA_DECOR,

				CASE LSRASS_KEY_COD_ASS
				when  null then ''
				else LSRASS_KEY_COD_ASS
				end 
				associazione,
				LSRASS_DESCRIZIONE

				FROM LSRRAD_GEV left join LSRASS on LSRASS_KEY_COD_ASS = LSRRAD_ASSOCIAZIONE,
					LSRTIT
				WHERE LSRRAD_COD_LOTTO = @CODLTM
				--AND LSRRAD_ASSOCIAZIONE = LSRASS_KEY_COD_ASS
				AND LSRRAD_FK_DATA_INS_TIT = @FKDATAINS
				AND LSRRAD_FK_ORA_INS_TIT = @FKORAINS
				--AND LSRASS_KEY_COD_ASS = LSRRAD_ASSOCIAZIONE
				AND LSRTIT_KEY_ID_RICEV = @CODLTM
				AND LSRTIT_KEY_DATA_INS = @FKDATAINS
				AND LSRTIT_KEY_ORA_INS = @FKORAINS
		END
	
		
	END

	IF @TIPODOC = 'ITV'
	BEGIN

		IF @FKDATAINS IS null
		BEGIN	
			SELECT LSRCON_ITVM_DATA_DOCUMENTO, LSRCON_ITVM_DATA_INVIO_DOC, LSRCON_ITVM_DATA_CESSAZIONE,LSRCON_ITVM_DATA_LETTERA, LSRCON_ITVM_FLAG_ANAG,
				LSRCON_ITVM_NUM_PROT_DOC, LSRCON_ITVM_COGNOME, LSRCON_ITVM_NOME, 
				LSRCON_ITVM_NOTE, LSRCON_ITVM_KEY_DATA_INS, LSRCON_ITVM_KEY_ORA_INS,LSRCON_ITVM_FLAG_ANAG,
				CASE LSRCON_ITVM_FLAG_ANAG
				WHEN '0' THEN 'NON ABBINATO'
				WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
				WHEN '2' THEN 'ABBINATO TITOLARE PRECEDENTE'
				END
				ABBINAMENTO
				FROM LSRCON_ITVM 
				WHERE LSRCON_ITVM_COD_LOTTO = @CODLTM
				--AND LSRRAD_ASSOCIAZIONE = LSRASS_KEY_COD_ASS
				AND LSRCON_ITVM_FK_DATA_INS_TIT IS NULL
				AND LSRCON_ITVM_FK_ORA_INS_TIT IS NULL
				--AND LSRASS_KEY_COD_ASS = LSRRAD_ASSOCIAZIONE
		END
		ELSE
		BEGIN
			SELECT LSRCON_ITVM_DATA_DOCUMENTO, LSRCON_ITVM_DATA_INVIO_DOC, LSRCON_ITVM_DATA_CESSAZIONE, LSRCON_ITVM_DATA_LETTERA,LSRCON_ITVM_FLAG_ANAG,
				LSRCON_ITVM_NUM_PROT_DOC, LSRCON_ITVM_COGNOME, LSRCON_ITVM_NOME, 
				LSRCON_ITVM_NOTE, LSRCON_ITVM_KEY_DATA_INS, LSRCON_ITVM_KEY_ORA_INS,LSRCON_ITVM_FLAG_ANAG,
				CASE LSRCON_ITVM_FLAG_ANAG
				WHEN '0' THEN 'NON ABBINATO'
				WHEN '1' THEN 'ABBINATO TITOLARE ATTUALE'
				WHEN '2' THEN 'ABBINATO TITOLARE PRECEDENTE'
				END
				ABBINAMENTO
				FROM LSRCON_ITVM , LSRTIT
				WHERE LSRCON_ITVM_COD_LOTTO = @CODLTM
				--AND LSRRAD_ASSOCIAZIONE = LSRASS_KEY_COD_ASS
				AND LSRCON_ITVM_FK_DATA_INS_TIT = @FKDATAINS
				AND LSRCON_ITVM_FK_ORA_INS_TIT = @FKORAINS
				--AND LSRASS_KEY_COD_ASS = LSRRAD_ASSOCIAZIONE
				AND LSRTIT_KEY_ID_RICEV = @CODLTM
				AND LSRTIT_KEY_DATA_INS = @FKDATAINS
				AND LSRTIT_KEY_ORA_INS = @FKORAINS
		END
	
		
	END
	

END
GO
