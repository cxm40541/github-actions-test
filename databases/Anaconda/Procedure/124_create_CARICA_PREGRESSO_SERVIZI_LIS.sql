/****** Object:  StoredProcedure [dbo].[CARICA_PREGRESSO_SERVIZI_LIS]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[CARICA_PREGRESSO_SERVIZI_LIS] 
AS


DECLARE	@Ricev			char(6),
		@CodServ		char(2),
		@DataAttiv		char(8),
		@DataDisattiv		char(8),
		@Stato			char(1),
		@DataElab		char(8),

		@Categoria		char(2),
		@Servizio		char(2),
		@Attivita		char(2),
				
		@Oggi			char(8),
		@Ora			char(8)


SELECT @Oggi = CONVERT (varchar(10), getdate() ,112)
SELECT @Ora = '00000000'

-- Cancello tutti i record delle tabelle LIS
DELETE FROM LSRSER_TEL
DELETE FROM LSRSER_CITT
DELETE FROM LSRSER_PAG
DELETE FROM LSRSER_BIG
DELETE FROM LSRSER_ATTI
DELETE FROM LSRLET_LIS
DELETE FROM lsrade_lis
DELETE FROM lsraut_lis
DELETE FROM lsrcon_lis
DELETE FROM lsrfid_lis
DELETE FROM lsrrad_lis
DELETE FROM lsrrin_lis

--Il cursore CUR_01 serve per prendere tutti i record di pregresso_servizi_LIS 
DECLARE CUR_R1 SCROLL CURSOR FOR
SELECT *
FROM pregresso_servizi_LIS 
--WHERE cod_lottomatica like 'ba%'
--where cod_lottomatica like 've22%'
order by 1

OPEN CUR_R1
FETCH NEXT FROM CUR_R1
INTO @Ricev, @CodServ, @DataAttiv, @DataDisattiv, @Stato, @DataElab

WHILE @@FETCH_STATUS = 0 
BEGIN
--	print @Ricev
--	print @CodServ
--	print @DataAttiv
--	print @DataDisattiv
--	print @Stato
--	print @DataElab

	SELECT @Ora = @Ora + 1
	if (@DataElab is null  or @DataElab = '')
	begin
		select @DataElab = @Oggi
	end

--	select @Categoria = categoria,
--		@Servizio = servizio,
--		@Attivita = attivita
--	from  servizi_LIS
--	from lsrser_lis_dec
--	where cod_Servizio = @CodServ

	select @Categoria = lsrser_lis_dec_categoria,
		@Servizio = lsrser_lis_dec_servizio,
		@Attivita = lsrser_lis_dec_attivita
	from lsrser_lis_dec
	where lsrser_lis_cod_servizio = @CodServ 

--	print @Categoria + @Servizio + @Attivita
	--***********************************
	--TABELLA LSRSER_TEL
	--***********************************
	IF @Categoria = '01'
	BEGIN
		INSERT INTO LSRSER_TEL 
		VALUES(@Ricev,
			@DataElab,
			@Ora,
			@Categoria,
			@Servizio,
			@Attivita,
			'1',
			@DataAttiv,
			'',
			'',
			'',
			'',
			'UC_USER',
			'Caricamento Pregresso',
			@Oggi,
			'Y'
			)
		--Se lo stato è uguale a 2 inserisco il record relativo alla disattivazione
		IF (@STATO = '2')
		BEGIN
			SELECT @Ora = @Ora + 1
			INSERT INTO LSRSER_TEL 
			VALUES(@Ricev,
				@DataElab,
				@Ora,
				@Categoria,
				@Servizio,
				@Attivita,
				'2',
				@DataDisattiv,
				'',
				'',
				'',
				'',
				'UC_USER',
				'Caricamento Pregresso',
				@Oggi,
				'Y'
				)
			

		END

	END --END LSRSER_TEL

	
	--***********************************
	--TABELLA LSRSER_CITT
	--***********************************
	IF @Categoria = '02'
	BEGIN
		INSERT INTO LSRSER_CITT
		VALUES(@Ricev,
			@DataElab,
			'00000000',
			@Categoria,
			@Servizio,
			@Attivita,
			'1',
			@DataAttiv,
			'',
			'',
			'',
			'',
			'UC_USER',
			'Caricamento Pregresso',
			@Oggi,
			'Y'
			)
		--Se lo stato è uguale a 2 inserisco il record relativo alla disattivazione
		IF (@STATO = '2')
		BEGIN
			SELECT @Ora = @Ora + 1
			INSERT INTO LSRSER_CITT 
			VALUES(@Ricev,
				@DataElab,
				@Ora,
				@Categoria,
				@Servizio,
				@Attivita,
				'2',
				@DataDisattiv,
				'',
				'',
				'',
				'',
				'UC_USER',
				'Caricamento Pregresso',
				@Oggi,
				'Y'
				)
			

		END

	END --END LSRSER_CITT

	--***********************************
	--TABELLA LSRSER_PAG
	--***********************************
	IF @Categoria = '03'
	BEGIN
		INSERT INTO LSRSER_PAG
		VALUES(@Ricev,
			@DataElab,
			'00000000',
			@Categoria,
			@Servizio,
			@Attivita,
			'1',
			@DataAttiv,
			'',
			'',
			'',
			'',
			'UC_USER',
			'Caricamento Pregresso',
			@Oggi,
			'Y'
			)
		--Se lo stato è uguale a 2 inserisco il record relativo alla disattivazione
		IF (@STATO = '2')
		BEGIN
			SELECT @Ora = @Ora + 1
			INSERT INTO LSRSER_PAG
			VALUES(@Ricev,
				@DataElab,
				@Ora,
				@Categoria,
				@Servizio,
				@Attivita,
				'2',
				@DataDisattiv,
				'',
				'',
				'',
				'',
				'UC_USER',
				'Caricamento Pregresso',
				@Oggi,
				'Y'
				)
			

		END

	END --END LSRSER_PAG


	--***********************************
	--TABELLA LSRSER_BIG
	--***********************************
	IF @Categoria = '04'
	BEGIN
		INSERT INTO LSRSER_BIG
		VALUES(@Ricev,
			@DataElab,
			'00000000',
			@Categoria,
			@Servizio,
			@Attivita,
			'1',
			@DataAttiv,
			'',
			'',
			'',
			'',
			'UC_USER',
			'Caricamento Pregresso',
			@Oggi,
			'Y'
			)
		--Se lo stato è uguale a 2 inserisco il record relativo alla disattivazione
		IF (@STATO = '2')
		BEGIN
			SELECT @Ora = @Ora + 1
			
			INSERT INTO LSRSER_BIG
			VALUES(@Ricev,
				@DataElab,
				@Ora,
				@Categoria,
				@Servizio,
				@Attivita,
				'2',
				@DataDisattiv,
				'',
				'',
				'',
				'',
				'UC_USER',
				'Caricamento Pregresso',
				@Oggi,
				'Y'
				)
			

		END

	END --END LSRSER_BIG

	--***********************************
	--TABELLA LSRSER_ATTI
	--***********************************
	IF @Categoria = '05'
	BEGIN
		INSERT INTO LSRSER_ATTI
		VALUES(@Ricev,
			@DataElab,
			'00000000',
			@Categoria,
			@Servizio,
			@Attivita,
			'1',
			@DataAttiv,
			'',
			'',
			'',
			'',
			'UC_USER',
			'Caricamento Pregresso',
			@Oggi,
			'Y'
			)
		--Se lo stato è uguale a 2 inserisco il record relativo alla disattivazione
		IF (@STATO = '2')
		BEGIN
			SELECT @Ora = @Ora + 1

			INSERT INTO LSRSER_ATTI
			VALUES(@Ricev,
				@DataElab,
				@Ora,
				@Categoria,
				@Servizio,
				@Attivita,
				'2',
				@DataDisattiv,
				'',
				'',
				'',
				'',
				'UC_USER',
				'Caricamento Pregresso',
				@Oggi,
				'Y'
				)
			

		END

	END --END LSRSER_ATTI



	FETCH NEXT FROM CUR_R1		
	INTO @Ricev, @CodServ, @DataAttiv, @DataDisattiv, @Stato, @DataElab


END

CLOSE CUR_R1
DEALLOCATE CUR_R1
GO
