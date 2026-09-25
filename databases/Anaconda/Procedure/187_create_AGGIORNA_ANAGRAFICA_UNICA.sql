/****** Object:  StoredProcedure [dbo].[AGGIORNA_ANAGRAFICA_UNICA]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE       PROCEDURE [dbo].[AGGIORNA_ANAGRAFICA_UNICA] AS

DECLARE

@IERI 			CHAR(8),
@OGGI 		CHAR(8),

@RICEVITORIA 	CHAR(6),
@COD_AMM	 	CHAR(6),
@LSR01A_RICEVITORIA 	CHAR(6),
@ric_appo	CHAR(6),
@data_appo	CHAR(8),
@ser_appo	CHAR(3),
@COMUNE 		CHAR(24),
@PROVINCIA 		CHAR(2), 
@CAP 			CHAR(5), 
@INDIRIZZO 		CHAR(40),
@TELEFONO 		CHAR(12),


@LSR01A_COMUNE 		CHAR(24),
@LSR01A_PROVINCIA 	CHAR(2), 
@LSR01A_CAP 		CHAR(5), 
@LSR01A_INDIRIZZO 		CHAR(40),
@LSR01A_TELEFONO 		CHAR(12),


@STATORICEV 	CHAR(1),
@STATOLOTTO 	CHAR(1),
@STATOTRIS 		CHAR(1),
@STATOGEV 		CHAR(1),
@STATOCONI		CHAR(1),
@STATOST		CHAR(1),
@STATOBOLLO	CHAR(1),
@STATOGP		CHAR(1),

@STRINGA 		VARCHAR(100),
@MSGERR		VARCHAR(100),
@FLAG 		INT,
@NOMEJOB		VARCHAR(25)

SELECT @NOMEJOB = ''

SELECT @OGGI = CONVERT(CHAR(8), GETDATE(), 112)

-- ****************************************************************************************--
-- ******************* PRENDO LE VARIAZIONI DI INDIRIZZO *******************--
-- ****************************************************************************************--
DECLARE CUR_RIC CURSOR FOR 
SELECT LSRRIC_KEY_ID_RICEV,
	LSRRIC_COMUNE_RICEV,
	LSRRIC_PROV_RICEV,
	LSRRIC_CAP,
	LSRRIC_INDIRIZZO, 
	lsrric_tel_ricevitoria, 
	 lsrric_cod_amm
FROM LSRRIC 
WHERE LSRRIC_FT_VOS =  @OGGI
and LSRRIC_indirizzo not like '%XXXXXXXXX%'

OPEN CUR_RIC
FETCH NEXT FROM CUR_RIC INTO @RICEVITORIA, @COMUNE, @PROVINCIA, @CAP, @INDIRIZZO, @telefono, @COD_AMM
WHILE @@FETCH_STATUS = 0 
BEGIN
	select @LSR01A_COMUNE = ''
	SELECT @LSR01A_PROVINCIA = ''
	SELECT @LSR01A_CAP = ''
	SELECT @LSR01A_INDIRIZZO = ''
	SELECT @LSR01A_TELEFONO = ''

	SELECT @LSR01A_COMUNE = LSR01A_COMUNE_RICEV,
		@LSR01A_PROVINCIA = LSR01A_PROV_RICEV,
		@LSR01A_CAP = LSR01A_CAP,
		@LSR01A_INDIRIZZO = LSR01A_INDIRIZZO,
		@LSR01A_TELEFONO = lsr01a_tel_ricevitoria
	FROM CONDIVISO.DBO.LSR01A_IERI
	WHERE LSR01A_KEY_ID_RICEV = @RICEVITORIA
	IF (   	@LSR01A_COMUNE <> @COMUNE OR
		@LSR01A_PROVINCIA <> @PROVINCIA OR
		@LSR01A_CAP <> @CAP OR
		@LSR01A_INDIRIZZO <> @INDIRIZZO OR	
		@LSR01A_TELEFONO <> @TELEFONO
		)	
	BEGIN

		select @ric_appo = ''
		select @data_appo = ''
		select @ric_appo = lsruni_ind_id_ricev,
			@data_appo = lsruni_ind_data
		from LSRUNI_IND
		where lsruni_ind_id_ricev = @RICEVITORIA
			and lsruni_ind_data = @OGGI
		if (@ric_appo = '' and @data_appo = '')
		begin
			if (@RICEVITORIA  between 'B00001' and 'B09999') or (@RICEVITORIA between 'A10000' and 'A89999') 
			begin
				select @INDIRIZZO = ltrim(rtrim(@INDIRIZZO)) + ' GC'
			end
			

			INSERT INTO LSRUNI_IND
			VALUES (@RICEVITORIA, @COMUNE, @PROVINCIA, @CAP, @INDIRIZZO, @TELEFONO,@COD_AMM, @OGGI, '')
	
			IF @@ERROR <> 0
			BEGIN
				SELECT @MSGERR = 'ERRORE IN INSERT LSRUNI_IND'
				RAISERROR (@MSGERR, 16, 1)
				EXEC MSDB..UT_AA004 9999, @NOMEJOB, @MSGERR, 0
				EXEC MSDB..UT_AA004 9999, @NOMEJOB, 'S.P. AGGIORNA_ANAGRAFICA_UNICA TERMINATA IN MODO ANOMALO', 0
	
				CLOSE CUR_RIC
				DEALLOCATE CUR_RIC
	
				RETURN
			END
		end
	END

	FETCH NEXT FROM CUR_RIC INTO @RICEVITORIA, @COMUNE, @PROVINCIA, @CAP, @INDIRIZZO, @telefono, @COD_AMM
END  

CLOSE CUR_RIC
DEALLOCATE CUR_RIC


-- ****************************************************************************************--
-- **************************** PRENDO I NUOVI PDV ******************************--
-- ****************************************************************************************--

DECLARE CUR_RIC CURSOR FOR 
SELECT LSR01A_KEY_ID_RICEV,
	LSR01A_COMUNE_RICEV,
	LSR01A_PROV_RICEV,
	LSR01A_CAP,
	LSR01A_INDIRIZZO,
lsr01a_tel_ricevitoria,
lsr01a_cod_amm
FROM CONDIVISO.DBO.LSR01A
WHERE LSR01A_KEY_ID_RICEV NOT IN (
	SELECT LSR01A_KEY_ID_RICEV
	FROM CONDIVISO.DBO.LSR01A_IERI
)
and LSR01a_indirizzo not like '%XXXXXXXXX%'


OPEN CUR_RIC
FETCH NEXT FROM CUR_RIC INTO @RICEVITORIA, @COMUNE, @PROVINCIA, @CAP, @INDIRIZZO, @telefono, @COD_AMM
WHILE @@FETCH_STATUS = 0 
BEGIN

	select @ric_appo = ''
	select @data_appo = ''
	select @ric_appo = lsruni_ind_id_ricev,
		@data_appo = lsruni_ind_data
	from LSRUNI_IND
	where lsruni_ind_id_ricev = @RICEVITORIA
		and lsruni_ind_data = @OGGI
	if (@ric_appo = '' and @data_appo = '')
	begin
	
		if (@RICEVITORIA between 'B00001' and 'B09999')  or (@RICEVITORIA between 'A10000' and 'A89999') 
		begin
			select @INDIRIZZO = @INDIRIZZO + ' GC'
		end
		

		INSERT INTO LSRUNI_IND
		VALUES (@RICEVITORIA, @COMUNE, @PROVINCIA, @CAP, @INDIRIZZO, @telefono, @COD_AMM, @OGGI, '')
		
		IF @@ERROR <> 0
		BEGIN
			SELECT @MSGERR = 'ERRORE IN INSERT LSRUNI_IND'
			RAISERROR (@MSGERR, 16, 1)
			EXEC MSDB..UT_AA004 9999, @NOMEJOB, @MSGERR, 0
			EXEC MSDB..UT_AA004 9999, @NOMEJOB, 'S.P. AGGIORNA_ANAGRAFICA_UNICA TERMINATA IN MODO ANOMALO', 0
	
			CLOSE CUR_RIC
			DEALLOCATE CUR_RIC
	
			RETURN
		END
	end
	FETCH NEXT FROM CUR_RIC INTO @RICEVITORIA, @COMUNE, @PROVINCIA, @CAP, @INDIRIZZO, @telefono, @COD_AMM
END
CLOSE CUR_RIC
DEALLOCATE CUR_RIC



-- ****************************************************************************************--
-- *************************** MOVIMENTAZIONI LOTTO  *************************--
-- ****************************************************************************************--


DECLARE CUR_RIC CURSOR FOR 
SELECT LSRSER_LOTTO_KEY_ID_RICEV,
	LSRSER_LOTTO_TIPO_PROVV
FROM  LSRSER_LOTTO
WHERE LSRSER_LOTTO_FT_VOS =  @OGGI


OPEN CUR_RIC
FETCH NEXT FROM CUR_RIC INTO @RICEVITORIA, @STATORICEV
WHILE @@FETCH_STATUS = 0 
BEGIN

	IF @STATORICEV = 'A' 
	BEGIN
		SELECT @STATOLOTTO = '1'
	END
	ELSE IF @STATORICEV = 'S' OR @STATORICEV = 'R' OR @STATORICEV = 'M' 
	BEGIN
		SELECT @STATOLOTTO = '2'
	END
	ELSE
	BEGIN
		SELECT @STATOLOTTO = '0'
	END

	select @ric_appo = ''
	select @data_appo = ''
	select @ser_appo = ''
	select @ric_appo = lsruni_ser_id_ricev,
		@data_appo = lsruni_ser_data,
		@ser_appo = lsruni_ser_cod_ser
	from LSRUNI_ser
	where lsruni_ser_id_ricev = @RICEVITORIA
		and lsruni_ser_data = @OGGI
		and lsruni_ser_cod_ser = '1'

	if (@ric_appo = '' and @data_appo = '' and @ser_appo = '')
	begin

		INSERT INTO LSRUNI_SER
		VALUES (@RICEVITORIA, '1', @STATOLOTTO,  @OGGI, '')
	
		IF @@ERROR <> 0
		BEGIN
			SELECT @MSGERR = 'ERRORE IN INSERT LSRUNI_SER'
			RAISERROR (@MSGERR, 16, 1)
			EXEC MSDB..UT_AA004 9999, @NOMEJOB, @MSGERR, 0
			EXEC MSDB..UT_AA004 9999, @NOMEJOB, 'S.P. AGGIORNA_ANAGRAFICA_UNICA TERMINATA IN MODO ANOMALO', 0
	
			CLOSE CUR_RIC
			DEALLOCATE CUR_RIC
	
			RETURN
		END
	end
	FETCH NEXT FROM CUR_RIC INTO @RICEVITORIA, @STATORICEV
END
CLOSE CUR_RIC
DEALLOCATE CUR_RIC

-- ****************************************************************************************--
-- *************************** MOVIMENTAZIONI CONI *****************************--
-- ****************************************************************************************--


DECLARE CUR_RIC CURSOR FOR 
SELECT LSRSER_CONI_KEY_ID_RICEV,
	LSRSER_CONI_STATO
FROM  LSRSER_CONI
WHERE LSRSER_CONI_FT_VOS =  @OGGI

OPEN CUR_RIC
FETCH NEXT FROM CUR_RIC INTO @RICEVITORIA, @STATOCONI
WHILE @@FETCH_STATUS = 0 
BEGIN

	select @ric_appo = ''
	select @data_appo = ''
	select @ser_appo = ''
	select @ric_appo = lsruni_ser_id_ricev,
		@data_appo = lsruni_ser_data,
		@ser_appo = lsruni_ser_cod_ser
	from LSRUNI_ser
	where lsruni_ser_id_ricev = @RICEVITORIA
		and lsruni_ser_data = @OGGI
		and lsruni_ser_cod_ser = '2'

	if (@ric_appo = '' and @data_appo = '' and @ser_appo = '')
	begin
	
		INSERT INTO LSRUNI_SER
		VALUES (@RICEVITORIA, '2', @STATOCONI,  @OGGI, '')
	
		IF @@ERROR <> 0
		BEGIN
			SELECT @MSGERR = 'ERRORE IN INSERT LSRUNI_SER'
			RAISERROR (@MSGERR, 16, 1)
			EXEC MSDB..UT_AA004 9999, @NOMEJOB, @MSGERR, 0
			EXEC MSDB..UT_AA004 9999, @NOMEJOB, 'S.P. AGGIORNA_ANAGRAFICA_UNICA TERMINATA IN MODO ANOMALO', 0
	
			CLOSE CUR_RIC
			DEALLOCATE CUR_RIC
	
			RETURN
		END
	end
	FETCH NEXT FROM CUR_RIC INTO @RICEVITORIA, @STATOCONI
END
CLOSE CUR_RIC
DEALLOCATE CUR_RIC




-- ****************************************************************************************--
-- *************** MOVIMENTAZIONI SCOMMESSE SPORTIVE ****************--
-- ****************************************************************************************--


DECLARE CUR_RIC CURSOR FOR 
SELECT LSRSER_ST_KEY_ID_RICEV,
	LSRSER_ST_STATO
FROM  LSRSER_ST
WHERE LSRSER_ST_FT_VOS =  @OGGI


OPEN CUR_RIC
FETCH NEXT FROM CUR_RIC INTO @RICEVITORIA, @STATOST
WHILE @@FETCH_STATUS = 0 
BEGIN

	select @ric_appo = ''
	select @data_appo = ''
	select @ser_appo = ''
	select @ric_appo = lsruni_ser_id_ricev,
		@data_appo = lsruni_ser_data,
		@ser_appo = lsruni_ser_cod_ser
	from LSRUNI_ser
	where lsruni_ser_id_ricev = @RICEVITORIA
		and lsruni_ser_data = @OGGI
		and lsruni_ser_cod_ser = '6'

	if (@ric_appo = '' and @data_appo = '' and @ser_appo = '')
	begin
	
		INSERT INTO LSRUNI_SER
		VALUES (@RICEVITORIA, '6', @STATOST,  @OGGI, '')
	
		IF @@ERROR <> 0
		BEGIN
			SELECT @MSGERR = 'ERRORE IN INSERT LSRUNI_SER'
			RAISERROR (@MSGERR, 16, 1)
			EXEC MSDB..UT_AA004 9999, @NOMEJOB, @MSGERR, 0
			EXEC MSDB..UT_AA004 9999, @NOMEJOB, 'S.P. AGGIORNA_ANAGRAFICA_UNICA TERMINATA IN MODO ANOMALO', 0
	
			CLOSE CUR_RIC
			DEALLOCATE CUR_RIC
	
			RETURN
		END
	end
	FETCH NEXT FROM CUR_RIC INTO @RICEVITORIA, @STATOST
END
CLOSE CUR_RIC
DEALLOCATE CUR_RIC


-- ****************************************************************************************--
-- *************** MOVIMENTAZIONI SCOMMESSE IPPICHE *******************--
-- ****************************************************************************************--


DECLARE CUR_RIC CURSOR FOR 
SELECT LSRSER_TRIS_KEY_ID_RICEV,
	LSRSER_TRIS_STATO
FROM  LSRSER_TRIS
WHERE LSRSER_TRIS_FT_VOS =  @OGGI


OPEN CUR_RIC
FETCH NEXT FROM CUR_RIC INTO @RICEVITORIA, @STATOTRIS
WHILE @@FETCH_STATUS = 0 
BEGIN
	select @ric_appo = ''
	select @data_appo = ''
	select @ser_appo = ''
	select @ric_appo = lsruni_ser_id_ricev,
		@data_appo = lsruni_ser_data,
		@ser_appo = lsruni_ser_cod_ser
	from LSRUNI_ser
	where lsruni_ser_id_ricev = @RICEVITORIA
		and lsruni_ser_data = @OGGI
		and lsruni_ser_cod_ser = '701'

	if (@ric_appo = '' and @data_appo = '' and @ser_appo = '')
	begin

		
		INSERT INTO LSRUNI_SER
		VALUES (@RICEVITORIA, '701', @STATOTRIS,  @OGGI, '')
	
		IF @@ERROR <> 0
		BEGIN
			SELECT @MSGERR = 'ERRORE IN INSERT LSRUNI_SER'
			RAISERROR (@MSGERR, 16, 1)
			EXEC MSDB..UT_AA004 9999, @NOMEJOB, @MSGERR, 0
			EXEC MSDB..UT_AA004 9999, @NOMEJOB, 'S.P. AGGIORNA_ANAGRAFICA_UNICA TERMINATA IN MODO ANOMALO', 0
	
			CLOSE CUR_RIC
			DEALLOCATE CUR_RIC
	
			RETURN
		END
	end
	FETCH NEXT FROM CUR_RIC INTO @RICEVITORIA, @STATOTRIS
END
CLOSE CUR_RIC
DEALLOCATE CUR_RIC

-- ****************************************************************************************--
-- ******************************** MOVIMENTAZIONI G&V ************************************--
-- ****************************************************************************************--

DECLARE CUR_RIC CURSOR FOR 
SELECT LSRSER_GEV_KEY_ID_RICEV,
	LSRSER_GEV_STATO
FROM  LSRSER_GEV
WHERE LSRSER_GEV_FT_VOS =  @OGGI
and LSRSER_GEV_KEY_ID_RICEV not in (SELECT DISTINCT KEY_ID_RICEV FROM TTB_V)
union 
SELECT LSRSER_GEV_KEY_ID_RICEV,
	LSRSER_GEV_STATO
FROM  LSRSER_GEV
WHERE LSRSER_GEV_KEY_DATA_INS =  @OGGI
and LSRSER_GEV_KEY_ID_RICEV  in (SELECT DISTINCT KEY_ID_RICEV FROM TTB_V)

OPEN CUR_RIC
FETCH NEXT FROM CUR_RIC INTO @RICEVITORIA, @STATOGEV
WHILE @@FETCH_STATUS = 0 
BEGIN

	select @ric_appo = ''
	select @data_appo = ''
	select @ser_appo = ''
	select @ric_appo = lsruni_ser_id_ricev,
		@data_appo = lsruni_ser_data,
		@ser_appo = lsruni_ser_cod_ser
	from LSRUNI_ser
	where lsruni_ser_id_ricev = @RICEVITORIA
		and lsruni_ser_data = @OGGI
		and lsruni_ser_cod_ser = '5'

	if (@ric_appo = '' and @data_appo = '' and @ser_appo = '')
	begin
		
		INSERT INTO LSRUNI_SER
		VALUES (@RICEVITORIA, '5', @STATOGEV,  @OGGI, '')
	
		IF @@ERROR <> 0
		BEGIN
			SELECT @MSGERR = 'ERRORE IN INSERT LSRUNI_SER'
			RAISERROR (@MSGERR, 16, 1)
			EXEC MSDB..UT_AA004 9999, @NOMEJOB, @MSGERR, 0
			EXEC MSDB..UT_AA004 9999, @NOMEJOB, 'S.P. AGGIORNA_ANAGRAFICA_UNICA TERMINATA IN MODO ANOMALO', 0
	
			CLOSE CUR_RIC
			DEALLOCATE CUR_RIC
	
			RETURN
		END
	end
	FETCH NEXT FROM CUR_RIC INTO @RICEVITORIA, @STATOGEV
END
CLOSE CUR_RIC
DEALLOCATE CUR_RIC


-- ****************************************************************************************--
-- ******************************** MOVIMENTAZIONI BOLLO ***********************************--
-- ****************************************************************************************--

DECLARE CUR_RIC CURSOR FOR 
SELECT LSRSER_BOLLO_KEY_ID_RICEV,
	LSRSER_BOLLO_STATO
FROM  LSRSER_BOLLO
WHERE LSRSER_BOLLO_FT_VOS =  @OGGI

OPEN CUR_RIC
FETCH NEXT FROM CUR_RIC INTO @RICEVITORIA, @STATOBOLLO
WHILE @@FETCH_STATUS = 0 
BEGIN

	select @ric_appo = ''
	select @data_appo = ''
	select @ser_appo = ''
	select @ric_appo = lsruni_ser_id_ricev,
		@data_appo = lsruni_ser_data,
		@ser_appo = lsruni_ser_cod_ser
	from LSRUNI_ser
	where lsruni_ser_id_ricev = @RICEVITORIA
		and lsruni_ser_data = @OGGI
		and lsruni_ser_cod_ser = '12'

	if (@ric_appo = '' and @data_appo = '' and @ser_appo = '')
	begin
		
		INSERT INTO LSRUNI_SER
		VALUES (@RICEVITORIA, '12', @STATOBOLLO,  @OGGI, '')
	
		IF @@ERROR <> 0
		BEGIN
			SELECT @MSGERR = 'ERRORE IN INSERT LSRUNI_SER'
			RAISERROR (@MSGERR, 16, 1)
			EXEC MSDB..UT_AA004 9999, @NOMEJOB, @MSGERR, 0
			EXEC MSDB..UT_AA004 9999, @NOMEJOB, 'S.P. AGGIORNA_ANAGRAFICA_UNICA TERMINATA IN MODO ANOMALO', 0
	
			CLOSE CUR_RIC
			DEALLOCATE CUR_RIC
	
			RETURN
		END
	end
	FETCH NEXT FROM CUR_RIC INTO @RICEVITORIA, @STATOBOLLO
END
CLOSE CUR_RIC
DEALLOCATE CUR_RIC


-- ****************************************************************************************--
-- ****************** MOVIMENTAZIONI GIOCHI PUBBLICI***********************--
-- ****************************************************************************************--

DECLARE CUR_RIC CURSOR FOR 
SELECT LSRSER_GP_KEY_ID_RICEV,
	LSRSER_GP_STATO
FROM  LSRSER_GP
WHERE LSRSER_GP_FT_VOS =  @OGGI

OPEN CUR_RIC
FETCH NEXT FROM CUR_RIC INTO @RICEVITORIA, @STATOGP
WHILE @@FETCH_STATUS = 0 
BEGIN

	select @ric_appo = ''
	select @data_appo = ''
	select @ser_appo = ''
	select @ric_appo = lsruni_ser_id_ricev,
		@data_appo = lsruni_ser_data,
		@ser_appo = lsruni_ser_cod_ser
	from LSRUNI_ser
	where lsruni_ser_id_ricev = @RICEVITORIA
		and lsruni_ser_data = @OGGI
		and lsruni_ser_cod_ser = '7'

	if (@ric_appo = '' and @data_appo = '' and @ser_appo = '')
	begin
		
		INSERT INTO LSRUNI_SER
		VALUES (@RICEVITORIA, '7', @STATOGP,  @OGGI, '')
	
		IF @@ERROR <> 0
		BEGIN
			SELECT @MSGERR = 'ERRORE IN INSERT LSRUNI_SER'
			RAISERROR (@MSGERR, 16, 1)
			EXEC MSDB..UT_AA004 9999, @NOMEJOB, @MSGERR, 0
			EXEC MSDB..UT_AA004 9999, @NOMEJOB, 'S.P. AGGIORNA_ANAGRAFICA_UNICA TERMINATA IN MODO ANOMALO', 0
	
			CLOSE CUR_RIC
			DEALLOCATE CUR_RIC
	
			RETURN
		END
	end
	FETCH NEXT FROM CUR_RIC INTO @RICEVITORIA, @STATOGP
END
CLOSE CUR_RIC
DEALLOCATE CUR_RIC



-- ****************************************************************************************--
-- *************************** AGGIORNO I FLAG ELABORAZIONE  AD N *************************--
-- ****************************************************************************************--
BEGIN TRANSACTION

UPDATE LSRUNI_IND SET LSRUNI_IND_FLAG_ELAB = 'N'
WHERE LSRUNI_IND_DATA = @OGGI

UPDATE LSRUNI_SER SET LSRUNI_SER_FLAG_ELAB = 'N'
WHERE LSRUNI_SER_DATA = @OGGI

COMMIT
GO
