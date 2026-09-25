/****** Object:  StoredProcedure [dbo].[Crea_Report_LIS]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Crea_Report_LIS] 
AS

DECLARE	@Stato			char(1),
                  	@Oggi			char(8),
	             @Ora			char(8),
	             @DataDecorr		char(8), 
		@StatoSer		char(1),
		@PIva			char(11),
		@Categoria		char(2),
		@Servizio		char(2),
		@Attivita		char(2),
		@NomeServizio		char(40),
		@Abi			char(5),
		@Cab			char(5),
		@Conto			char(15),

		@CodServizio		char(2),
		@CodRicev		char(6),
		@CodAmm		char(6),
		@DecodRicev		char(50),
		@Provincia		char(2),
		@Comune		char(24),
		@Cap			char(5),
		@Indirizzo		char(40),
		@Nome			char(20),
		@Cognome		char(24),
                  	@Note			char(150)
	

--BEGIN TRANSACTION

DELETE FROM lsrser_lis_report

SELECT @Oggi = CONVERT(CHAR,GETDATE(),112)
SELECT @Ora = SUBSTRING(CONVERT(CHAR,GETDATE(),121),12,2) + 
		SUBSTRING(CONVERT(CHAR,GETDATE(),121),15,2) +
		SUBSTRING(CONVERT(CHAR,GETDATE(),121),18,2) +
		SUBSTRING(CONVERT(CHAR,GETDATE(),121),21,2)

DECLARE CUR_R1 SCROLL CURSOR FOR

SELECT  lsrser_lis_dec_categoria,   lsrser_lis_dec_servizio,  lsrser_lis_dec_attivita, lsrser_lis_cod_servizio , lsrser_lis_dec_nome 
from lsrser_lis_dec A 
WHERE lsrser_lis_dec_servizio <>''
AND NOT EXISTS ( 
	SELECT * FROM lsrser_lis_dec 
 	WHERE A.lsrser_lis_dec_categoria = lsrser_lis_dec_categoria
 		AND A.lsrser_lis_dec_servizio = lsrser_lis_dec_servizio
 		AND lsrser_lis_dec_attivita <> ''
	)
UNION
SELECT  lsrser_lis_dec_categoria,  lsrser_lis_dec_servizio,  lsrser_lis_dec_attivita , lsrser_lis_cod_servizio , lsrser_lis_dec_nome 
FROM lsrser_lis_dec 
WHERE lsrser_lis_dec_categoria <> ''
	AND lsrser_lis_dec_servizio <> ''
	AND lsrser_lis_dec_attivita <> ''

OPEN CUR_R1
FETCH NEXT FROM CUR_R1
INTO @Categoria, @Servizio, @Attivita, @CodServizio, @NomeServizio


WHILE @@FETCH_STATUS = 0 
BEGIN

	--******************************************************************************
	--- TRATTAMENTO CATEGORIA 01 - Servizi Telefonici
	--******************************************************************************
	IF @Categoria = '01'
	BEGIN
		--Prendo tutte le ricevitorie attive/disattive al servizio
		DECLARE CUR_R2 SCROLL CURSOR FOR
		SELECT lsrser_tel_key_id_ricev, lsrser_tel_stato, lsrser_tel_data_decor
		FROM lsrser_tel A
		WHERE  lsrser_tel_key_categoria = @Categoria
			AND lsrser_tel_key_servizio = @Servizio
			AND lsrser_tel_key_attivita = @Attivita
			AND lsrser_tel_data_decor =
				(SELECT MAX(lsrser_tel_data_decor) 
				FROM lsrser_tel
				WHERE lsrser_tel_data_decor <= @Oggi
					AND lsrser_tel_key_categoria = @Categoria
					AND lsrser_tel_key_servizio = @Servizio
					AND lsrser_tel_key_attivita = @Attivita
					AND lsrser_tel_flag_validita = 'Y'
					AND lsrser_tel_key_id_ricev = A.lsrser_tel_key_id_ricev)
			AND lsrser_tel_flag_validita = 'Y'
			AND (lsrser_tel_stato= '1' OR lsrser_tel_stato= '2')
		

	END --End If @Categoria = 01


	--******************************************************************************
	--- TRATTAMENTO CATEGORIA 02 - SERVIZI AL CITTADINO
	--******************************************************************************
	IF @Categoria = '02'
	BEGIN

	             	SELECT @STATO = NULL

		DECLARE CUR_R2 SCROLL CURSOR FOR
		SELECT lsrser_citt_key_id_ricev, lsrser_citt_stato, lsrser_citt_data_decor
		FROM lsrser_citt A
		WHERE lsrser_citt_key_categoria = @Categoria
			AND lsrser_citt_key_servizio = @Servizio
			AND lsrser_citt_key_attivita = @Attivita
			AND lsrser_citt_data_decor =
			(SELECT MAX(lsrser_citt_data_decor) 
			FROM lsrser_citt
			WHERE lsrser_citt_data_decor <= @Oggi
				AND lsrser_citt_key_categoria = @Categoria
				AND lsrser_citt_key_servizio = @Servizio
				AND lsrser_citt_key_attivita = @Attivita
				AND lsrser_citt_flag_validita = 'Y'
				AND lsrser_citt_key_id_ricev = A. lsrser_citt_key_id_ricev)
			AND lsrser_citt_flag_validita = 'Y'
			AND (lsrser_citt_stato = '1' OR lsrser_citt_stato = '2')
	
	
	END --End If @Categoria = 02

	--******************************************************************************
	--- TRATTAMENTO CATEGORIA 03 - PAGAMENTO UTENZE
	--******************************************************************************
	IF @Categoria = '03'
	BEGIN

	             	SELECT @STATO = NULL

		DECLARE CUR_R2 SCROLL CURSOR FOR
		SELECT lsrser_pag_key_id_ricev, lsrser_pag_stato, lsrser_pag_data_decor
		FROM lsrser_pag A
		WHERE lsrser_pag_key_categoria = @Categoria
			AND lsrser_pag_key_servizio = @Servizio
			AND lsrser_pag_key_attivita = @Attivita
			AND lsrser_pag_data_decor =
			(SELECT MAX(lsrser_pag_data_decor) 
			FROM lsrser_pag
			WHERE lsrser_pag_data_decor <= @Oggi
				AND lsrser_pag_key_categoria = @Categoria
				AND lsrser_pag_key_servizio = @Servizio
				AND lsrser_pag_key_attivita = @Attivita
				AND lsrser_pag_flag_validita = 'Y'
				AND lsrser_pag_key_id_ricev = A.lsrser_pag_key_id_ricev)
			AND lsrser_pag_flag_validita = 'Y'
			AND (lsrser_pag_stato = '1' OR  lsrser_pag_stato = '2') 
	
	END --End If @Categoria = 03

	--******************************************************************************
	--- TRATTAMENTO CATEGORIA 04 - BIGLIETTERIA
	--******************************************************************************
	IF @Categoria = '04'
	BEGIN

	             	SELECT @STATO = NULL

		DECLARE CUR_R2 SCROLL CURSOR FOR
		SELECT lsrser_big_key_id_ricev, lsrser_big_stato, lsrser_big_data_decor
		FROM lsrser_big A
		WHERE lsrser_big_key_categoria = @Categoria
			AND lsrser_big_key_servizio = @Servizio
			AND lsrser_big_key_attivita = @Attivita
			AND lsrser_big_data_decor =
			(SELECT MAX(lsrser_big_data_decor) 
			FROM lsrser_big
			WHERE lsrser_big_data_decor <= @Oggi
				AND lsrser_big_key_categoria = @Categoria
				AND lsrser_big_key_servizio = @Servizio
				AND lsrser_big_key_attivita = @Attivita
				AND lsrser_big_flag_validita = 'Y'
				AND lsrser_big_key_id_ricev = A.lsrser_big_key_id_ricev)
			AND lsrser_big_flag_validita = 'Y'
			AND (lsrser_big_stato = '1' OR  lsrser_big_stato = '2')


	END --End If @Categoria = 04


	--******************************************************************************
	--- TRATTAMENTO CATEGORIA 05 - ATTI GIUDIZIARI
	--******************************************************************************
	IF @Categoria = '05'
	BEGIN

	             	SELECT @STATO = NULL

		DECLARE CUR_R2 SCROLL CURSOR FOR
		SELECT lsrser_atti_key_id_ricev, lsrser_atti_stato, lsrser_atti_data_decor
		FROM lsrser_atti A
		WHERE lsrser_atti_key_categoria = @Categoria
			AND lsrser_atti_key_servizio = @Servizio
			AND lsrser_atti_key_attivita = @Attivita
			AND lsrser_atti_data_decor =
			(SELECT MAX(lsrser_atti_data_decor) 
			FROM lsrser_atti 
			WHERE lsrser_atti_data_decor <= @Oggi
				AND lsrser_atti_key_categoria = @Categoria
				AND lsrser_atti_key_servizio = @Servizio
				AND lsrser_atti_key_attivita = @Attivita
				AND lsrser_atti_flag_validita = 'Y'
				AND lsrser_atti_key_id_ricev = A.lsrser_atti_key_id_ricev)
			AND lsrser_atti_flag_validita = 'Y'
			AND (lsrser_atti_stato = '1' OR lsrser_atti_stato = '2')

	END --End If @Categoria = 05


	OPEN CUR_R2
	FETCH NEXT FROM CUR_R2
	INTO @CodRicev, @StatoSer, @DataDecorr

	WHILE @@FETCH_STATUS = 0 
	BEGIN
		-- Prendo i dati di ricevitoria
		SELECT @Provincia = lsrric_prov_ricev,
			@CodAmm = lsrric_cod_amm,
			@Comune = lsrric_comune_ricev,
			@CodAmm = lsrric_cod_amm,
			@Cap = lsrric_cap,
			@Indirizzo = lsrric_indirizzo,
			@DecodRicev = lsrric_decod_ricev
		FROM lsrric
		WHERE lsrric_key_id_ricev = @CodRicev 
			AND lsrric_data_validita =
				(SELECT MAX(lsrric_data_validita) 
				FROM lsrric
				WHERE  lsrric_data_validita <= @Oggi
					AND lsrric_key_id_ricev = @CodRicev 
					AND lsrric_flag_validita = 'Y')
			AND lsrric_flag_validita = 'Y'

		-- Prendo i dati del titolare
		SELECT @Cognome = lsrtit_cognome,
			@Nome = lsrtit_nome
		FROM lsrtit
		WHERE lsrtit_key_id_ricev = @CodRicev 
			AND lsrtit_data_validita =
				(SELECT MAX(lsrtit_data_validita) 
				FROM lsrtit
				WHERE  lsrtit_data_validita <= @Oggi
					AND lsrtit_key_id_ricev = @CodRicev 
					AND lsrtit_flag_validita = 'Y')
			AND lsrtit_flag_validita = 'Y'

		-- Prendo le coordinate bancarie			
		SELECT @ABI = ''
		SELECT @CAB = ''

		SELECT @ABI = ABI, @CAB = CAB
		FROM  LWK04A_ARCHIVIO_ATTUALE
		WHERE COD_LOTTOMATICA = @CodRicev
			AND Denominazione = @DecodRicev

		-- Prendo la partita IVA
		SELECT @PIva = ''
		SELECT @PIva = lsrcon_lis_partita_iva
		FROM lsrcon_lis 
		WHERE lsrcon_lis_key_id_ricev = @CodRicev 
			AND lsrcon_lis_flag_anag = '1'
		
		-- Inserisco il report nella tabella 
		INSERT INTO  lsrser_lis_report 
		VALUES(@CodRicev,
			@CodAmm,
			@Categoria,
			@Servizio,
			@Attivita,
			@StatoSer,
			@DataDecorr,
			'',
			@Indirizzo,
			@Cap,
			@Comune,
			@Provincia,
			@PIva,
			@Abi,
			@Cab,
			'',
			@Cognome,
			@Nome,
			@NomeServizio)
		IF @@error <> 0 
		BEGIN
			RETURN
		END
		
		FETCH NEXT FROM CUR_R2		
		INTO @CodRicev, @StatoSer, @DataDecorr
	END	

	CLOSE CUR_R2
	DEALLOCATE CUR_R2

	
	FETCH NEXT FROM CUR_R1		
	INTO @Categoria, @Servizio, @Attivita, @CodServizio, @NomeServizio

END -- While

CLOSE CUR_R1
DEALLOCATE CUR_R1



--COMMIT TRANSACTION

RETURN
GO
