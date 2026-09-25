/****** Object:  StoredProcedure [dbo].[VARIAZIONE_DATI_PUNTO_VENDITA_CONI]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[VARIAZIONE_DATI_PUNTO_VENDITA_CONI]
	@RICEV 			CHAR(6),
	@TIPORIV		CHAR(1),
	@DATANASC		CHAR(8),
	@LUOGONASC		CHAR(24),
	@PROVNASC		CHAR(2),
	@CODFISC		CHAR(16),
	@SESSO			CHAR(1),
	@INDIRIZZO		CHAR(40),
	@CAP			CHAR(5),
	@COMUNE			CHAR(24),
	@PROVINCIA		CHAR(2),
	@PARTITAIVA		CHAR(11),
	@TELCASA		CHAR(12),
	@TELCELL		CHAR(12),

	@FIRMA			CHAR(17),
	@MSGERR			VARCHAR(100) OUTPUT
 AS



DECLARE 	@APPORICEV		CHAR(6),
		@APPODATA		CHAR(8),
		@DATAOGGI   		CHAR(8),
		@ORAOGGI  		CHAR(8),
		@FLAGANAGTIT	CHAR(1)


SELECT @DATAOGGI = CONVERT (VARCHAR(10), GETDATE(),112)
SELECT @ORAOGGI =
	SUBSTRING(CONVERT (VARCHAR(22), GETDATE(),121),12,2)+
 	SUBSTRING(CONVERT (VARCHAR(22), GETDATE(),121),15,2)+
 	SUBSTRING(CONVERT (VARCHAR(22), GETDATE(),121),18,2)+
 	SUBSTRING(CONVERT (VARCHAR(22), GETDATE(),121),21,2)


--EFFETTUO I SEGUENTI CONTROLLI:
-- 1) AGGIORNO IL RECORD SU LSRTIT_CONI
-- 2) AGGIORNO LE CHIAVI ESTERNE SU TUTTE LE TABELLE DI CONTRATTUALISTICA CONI


--*************************************************************************
--           STEP 1
--*************************************************************************
UPDATE LSRTIT_CONI 
SET	lsrtit_coni_key_data_ins = @DATAOGGI,
	lsrtit_coni_key_ora_ins = @ORAOGGI,
	lsrtit_coni_tipo_rec = @TIPORIV,
	lsrtit_coni_data_nascita = @DATANASC,
	lsrtit_coni_comune_nascita = @LUOGONASC,
	lsrtit_coni_provincia_nascita = @PROVNASC,
	lsrtit_coni_codice_fiscale_titolare = @CODFISC,
	lsrtit_coni_sesso = @SESSO,
	lsrtit_coni_indirizzo = @INDIRIZZO,
	lsrtit_coni_cap = @CAP,
	lsrtit_coni_comune = @COMUNE,
	lsrtit_coni_provincia = @PROVINCIA,
	lsrtit_coni_partita_iva = @PARTITAIVA,
	lsrtit_coni_tel_casa = @TELCASA,
	lsrtit_coni_tel_cell = @TELCELL,
	lsrtit_coni_firma = @FIRMA,
	lsrtit_coni_ft_vos = '00000000'
WHERE lsrtit_coni_key_id_ricev = @ricev
	and lsrtit_coni_data_validita =
		(select max(lsrtit_coni_data_validita) 
		from lsrtit_coni
		where lsrtit_coni_key_id_ricev = @ricev
		and  lsrtit_coni_data_validita <= @DataOggi
		and  lsrtit_coni_flag_validita = 'Y')
	and  lsrtit_coni_flag_validita = 'Y'



IF @@ERROR <> 0 
BEGIN
	SELECT @MSGERR = '9999 - ' + @RICEV +' ERRORE - AGGIORNAMNETO NON EFFETTUATO'
	RETURN
END
ELSE
BEGIN
	SELECT @MSGERR = @RICEV +' AGGIORNAMENTO EFFETTUATO CORRETTAMENTE'
END




--*************************************************************************
--           STEP 2
--*************************************************************************
-- LO STEP 2 VIENE ESEGUITO AUTOMATICAMENTE, IN QUANTO è STATO DEFINITO IL CONSTRAINT 
--DI AGGIORNAMENTO AUTOMATICO PER LE CHIAVI ESTERNE DEI CONTRATTI
GO
