/****** Object:  StoredProcedure [dbo].[CREA_LISTA_SERVIZI_ATTIVI_LIS]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[CREA_LISTA_SERVIZI_ATTIVI_LIS] 
AS

DECLARE	@Stato			char(1),
                  	@Oggi			char(8),
	             @Ora			char(8),
		@Categoria		char(2),
		@Servizio		char(2),
		@Attivita		char(2),
		@CodServizio		char(2),
		@CodRicev		char(6),
		@Provincia		char(2),
		@Comune		char(24),
		@Cap			char(5),
		@Indirizzo		char(40),
                  	@Note			char(150)
	



DELETE FROM lsrser_lis_attiv

SELECT @Oggi = CONVERT(CHAR,GETDATE(),112)
SELECT @Ora = SUBSTRING(CONVERT(CHAR,GETDATE(),121),12,2) + 
		SUBSTRING(CONVERT(CHAR,GETDATE(),121),15,2) +
		SUBSTRING(CONVERT(CHAR,GETDATE(),121),18,2) +
		SUBSTRING(CONVERT(CHAR,GETDATE(),121),21,2)

DECLARE CUR_R1 SCROLL CURSOR FOR

SELECT  lsrser_lis_dec_categoria,   lsrser_lis_dec_servizio,  lsrser_lis_dec_attivita, lsrser_lis_cod_servizio  
from lsrser_lis_dec A 
WHERE lsrser_lis_dec_servizio <>''
AND NOT EXISTS ( 
	SELECT * FROM lsrser_lis_dec 
 	WHERE A.lsrser_lis_dec_categoria = lsrser_lis_dec_categoria
 		AND A.lsrser_lis_dec_servizio = lsrser_lis_dec_servizio
 		AND lsrser_lis_dec_attivita <> ''
	)
UNION
SELECT  lsrser_lis_dec_categoria,  lsrser_lis_dec_servizio,  lsrser_lis_dec_attivita , lsrser_lis_cod_servizio 
FROM lsrser_lis_dec 
WHERE lsrser_lis_dec_categoria <> ''
	AND lsrser_lis_dec_servizio <> ''
	AND lsrser_lis_dec_attivita <> ''

OPEN CUR_R1
FETCH NEXT FROM CUR_R1
INTO @Categoria, @Servizio, @Attivita, @CodServizio


WHILE @@FETCH_STATUS = 0 
BEGIN

	--******************************************************************************
	--- TRATTAMENTO CATEGORIA 01 - Servizi Telefonici
	--******************************************************************************
	IF @Categoria = '01'
	BEGIN
		DECLARE CUR_R2 SCROLL CURSOR FOR
		SELECT lsrser_tel_key_id_ricev
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
			AND lsrser_tel_stato= '1'
		
		OPEN CUR_R2
		FETCH NEXT FROM CUR_R2
		INTO @CodRicev

		WHILE @@FETCH_STATUS = 0 
		BEGIN
			SELECT @Provincia = lsrric_prov_ricev,
				@Comune = lsrric_comune_ricev,
				@Cap = lsrric_cap,
				@Indirizzo = lsrric_indirizzo
			FROM lsrric
			WHERE lsrric_key_id_ricev = @CodRicev 
				AND lsrric_data_validita =
					(SELECT MAX(lsrric_data_validita) 
					FROM lsrric
					WHERE  lsrric_data_validita <= @Oggi
						AND lsrric_key_id_ricev = @CodRicev 
						AND lsrric_flag_validita = 'Y')
				AND lsrric_flag_validita = 'Y'
			
			INSERT INTO  lsrser_lis_attiv 
			VALUES(@CodRicev,
				@Provincia,
				@Comune,
				@Cap,
				@Indirizzo,
				@CodServizio)
			IF @@error <> 0 
			BEGIN
				RETURN
			END
		
			FETCH NEXT FROM CUR_R2		
			INTO @CodRicev
		END	

		CLOSE CUR_R2
		DEALLOCATE CUR_R2

	END --End If @Categoria = 01


	--******************************************************************************
	--- TRATTAMENTO CATEGORIA 02 - SERVIZI AL CITTADINO
	--******************************************************************************
	IF @Categoria = '02'
	BEGIN

	             	SELECT @STATO = NULL

		DECLARE CUR_R2 SCROLL CURSOR FOR
		SELECT lsrser_citt_key_id_ricev
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
			AND lsrser_citt_stato = '1'
		
		OPEN CUR_R2
		FETCH NEXT FROM CUR_R2
		INTO @CodRicev

		WHILE @@FETCH_STATUS = 0 
		BEGIN
			SELECT @Provincia = lsrric_prov_ricev,
				@Comune = lsrric_comune_ricev,
				@Cap = lsrric_cap,
				@Indirizzo = lsrric_indirizzo
			FROM lsrric
			WHERE lsrric_key_id_ricev = @CodRicev 
				AND lsrric_data_validita =
					(SELECT MAX(lsrric_data_validita) 
					FROM lsrric
					WHERE  lsrric_data_validita <= @Oggi
						AND lsrric_key_id_ricev = @CodRicev 
						AND lsrric_flag_validita = 'Y')
				AND lsrric_flag_validita = 'Y'
			
			INSERT INTO  lsrser_lis_attiv 
			VALUES(@CodRicev,
				@Provincia,
				@Comune,
				@Cap,
				@Indirizzo,
				@CodServizio)

			IF @@error <> 0 
			BEGIN
				RETURN
			END
		
			FETCH NEXT FROM CUR_R2		
			INTO @CodRicev
		END	

		CLOSE CUR_R2
		DEALLOCATE CUR_R2
	
	END --End If @Categoria = 02

	--******************************************************************************
	--- TRATTAMENTO CATEGORIA 03 - PAGAMENTO UTENZE
	--******************************************************************************
	IF @Categoria = '03'
	BEGIN

	             	SELECT @STATO = NULL

		DECLARE CUR_R2 SCROLL CURSOR FOR
		SELECT  lsrser_pag_key_id_ricev
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
			AND lsrser_pag_stato = '1'

		OPEN CUR_R2
		FETCH NEXT FROM CUR_R2
		INTO @CodRicev

		WHILE @@FETCH_STATUS = 0 
		BEGIN
			SELECT @Provincia = lsrric_prov_ricev,
				@Comune = lsrric_comune_ricev,
				@Cap = lsrric_cap,
				@Indirizzo = lsrric_indirizzo
			FROM lsrric
			WHERE lsrric_key_id_ricev = @CodRicev 
				AND lsrric_data_validita =
					(SELECT MAX(lsrric_data_validita) 
					FROM lsrric
					WHERE  lsrric_data_validita <= @Oggi
						AND lsrric_key_id_ricev = @CodRicev 
						AND lsrric_flag_validita = 'Y')
				AND lsrric_flag_validita = 'Y'
			
			INSERT INTO  lsrser_lis_attiv 
			VALUES(@CodRicev,
				@Provincia,
				@Comune,
				@Cap,
				@Indirizzo,
				@CodServizio)
			IF @@error <> 0 
			BEGIN
				RETURN
			END
		
			FETCH NEXT FROM CUR_R2		
			INTO @CodRicev
		END	

		CLOSE CUR_R2
		DEALLOCATE CUR_R2
	
	END --End If @Categoria = 03

	--******************************************************************************
	--- TRATTAMENTO CATEGORIA 04 - BIGLIETTERIA
	--******************************************************************************
	IF @Categoria = '04'
	BEGIN

	             	SELECT @STATO = NULL

		DECLARE CUR_R2 SCROLL CURSOR FOR
		SELECT  lsrser_big_key_id_ricev
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
			AND lsrser_big_stato = '1'

		OPEN CUR_R2
		FETCH NEXT FROM CUR_R2
		INTO @CodRicev

		WHILE @@FETCH_STATUS = 0 
		BEGIN
			SELECT @Provincia = lsrric_prov_ricev,
				@Comune = lsrric_comune_ricev,
				@Cap = lsrric_cap,
				@Indirizzo = lsrric_indirizzo
			FROM lsrric
			WHERE lsrric_key_id_ricev = @CodRicev 
				AND lsrric_data_validita =
					(SELECT MAX(lsrric_data_validita) 
					FROM lsrric
					WHERE  lsrric_data_validita <= @Oggi
						AND lsrric_key_id_ricev = @CodRicev 
						AND lsrric_flag_validita = 'Y')
				AND lsrric_flag_validita = 'Y'
			
			INSERT INTO  lsrser_lis_attiv 
			VALUES(@CodRicev,
				@Provincia,
				@Comune,
				@Cap,
				@Indirizzo,
				@CodServizio)

			IF @@error <> 0 
			BEGIN
				RETURN
			END
		
			FETCH NEXT FROM CUR_R2		
			INTO @CodRicev
		END	

		CLOSE CUR_R2
		DEALLOCATE CUR_R2

	END --End If @Categoria = 04


	--******************************************************************************
	--- TRATTAMENTO CATEGORIA 05 - ATTI GIUDIZIARI
	--******************************************************************************
	IF @Categoria = '05'
	BEGIN

	             	SELECT @STATO = NULL

		DECLARE CUR_R2 SCROLL CURSOR FOR
		SELECT lsrser_atti_key_id_ricev
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
			AND lsrser_atti_stato = '1'

		OPEN CUR_R2
		FETCH NEXT FROM CUR_R2
		INTO @CodRicev

		WHILE @@FETCH_STATUS = 0 
		BEGIN
			SELECT @Provincia = lsrric_prov_ricev,
				@Comune = lsrric_comune_ricev,
				@Cap = lsrric_cap,
				@Indirizzo = lsrric_indirizzo
			FROM lsrric
			WHERE lsrric_key_id_ricev = @CodRicev 
				AND lsrric_data_validita =
					(SELECT MAX(lsrric_data_validita) 
					FROM lsrric
					WHERE  lsrric_data_validita <= @Oggi
						AND lsrric_key_id_ricev = @CodRicev 
						AND lsrric_flag_validita = 'Y')
				AND lsrric_flag_validita = 'Y'
			
			INSERT INTO  lsrser_lis_attiv 
			VALUES(@CodRicev,
				@Provincia,
				@Comune,
				@Cap,
				@Indirizzo,
				@CodServizio)

			IF @@error <> 0 
			BEGIN
				RETURN
			END
		
			FETCH NEXT FROM CUR_R2		
			INTO @CodRicev
		END	

		CLOSE CUR_R2
		DEALLOCATE CUR_R2
	
	END --End If @Categoria = 05

	
	FETCH NEXT FROM CUR_R1		
	INTO @Categoria, @Servizio, @Attivita, @CodServizio

END -- While

CLOSE CUR_R1
DEALLOCATE CUR_R1



RETURN
GO
