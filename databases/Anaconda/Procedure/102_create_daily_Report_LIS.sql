/****** Object:  StoredProcedure [dbo].[daily_Report_LIS]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[daily_Report_LIS] AS
DECLARE	@Stato			char(1),
        @Oggi			char(8),
	@Ora			char(8),
	@DataDecorr		char(8), 
	@StatoSer		char(1),
	@PIva			char(11),
	@Categoria		char(2),
	@Servizio		char(2),
	@Attivita		char(2),
	@NomeServizio		char(30),
	@Abi			char(5),
	@Cab			char(5),
	@Conto			char(15),
 	@CodServizio		char(2),
	@CodRicev		char(6),
	@CodAmm			char(6),
	@DecodRicev		char(50),
	@Provincia		char(2),
	@Comune			char(24),
	@Cap			char(5),
	@Indirizzo		char(40),
	@Nome			char(20),
	@Cognome		char(24),
	@tipomovimentazione	char(1),
	@causale		char(100),
        @Note			char(150),
	@doc			char(10),
	@CAUSA			CHAR(1),
	@doc_fk			char(16),
	@lost			varchar(100)

--BEGIN TRANSACTION
DELETE FROM report_lis_tmp

/*DROP TABLE #report_lis_tmp 
CREATE TABLE #report_lis_tmp (
	[cod_lottomatica]	[char](6)   NULL ,
	[cod_amm] 		[char](6)   NULL ,
	[nome_servizio] 	[char](30)   NULL ,
	[denominazione] 	[char](50)   NULL ,
	[cognome] 		[char](24)   NULL ,
	[nome] 			[char](20)   NULL ,
	[data_decorr] 		[char](8)   NULL ,
	[stato] 		[char](1)   NULL ,
	[movimentazione] 	[char](1)   NULL ,
	[causale] 		[char](100)   NULL 
)
*/
SELECT @Oggi = CONVERT(CHAR,GETDATE() +1,112) 
--SELECT @Oggi = CONVERT(CHAR,GETDATE(),112) 
SELECT @Ora = SUBSTRING(CONVERT(CHAR,GETDATE(),121),12,2) + SUBSTRING(CONVERT(CHAR,GETDATE(),121),15,2) + SUBSTRING(CONVERT(CHAR,GETDATE(),121),18,2) +	SUBSTRING(CONVERT(CHAR,GETDATE(),121),21,2)

DECLARE CUR_R1 SCROLL CURSOR FOR
	SELECT  lsrser_lis_dec_categoria,
		lsrser_lis_dec_servizio,
		lsrser_lis_dec_attivita,
		lsrser_lis_cod_servizio,
		lsrser_lis_dec_nome 
	from lsrser_lis_dec A 
	WHERE lsrser_lis_dec_servizio <> ''
		AND NOT EXISTS ( 
		SELECT * FROM lsrser_lis_dec 
	 	WHERE A.lsrser_lis_dec_categoria = lsrser_lis_dec_categoria
	 		AND A.lsrser_lis_dec_servizio = lsrser_lis_dec_servizio
	 		AND lsrser_lis_dec_attivita <> ''
		)
	UNION
	SELECT  lsrser_lis_dec_categoria,
		lsrser_lis_dec_servizio,
		lsrser_lis_dec_attivita,
		lsrser_lis_cod_servizio,
		lsrser_lis_dec_nome 
	FROM lsrser_lis_dec 
	WHERE lsrser_lis_dec_categoria <> ''
		AND lsrser_lis_dec_servizio <> ''
		AND lsrser_lis_dec_attivita <> ''
			

OPEN CUR_R1
FETCH NEXT FROM CUR_R1
INTO @Categoria, @Servizio, @Attivita, @CodServizio, @NomeServizio

WHILE @@FETCH_STATUS = 0 
BEGIN  -- 1
	--print 'REC_CURSORE_1: ' + @Categoria + ' ' + @Servizio + ' ' + @Attivita + ' ' + @CodServizio + ' ' + @NomeServizio
	 
	select @causale = null
	select @doc = null
	select @doc_fk = null

	--******************************************************************************
	--- TRATTAMENTO CATEGORIA 01 - Servizi Telefonici
	--******************************************************************************
	IF @Categoria = '01'
	BEGIN 
		--print 'CATEGORIA 1'
	        SELECT @STATO = NULL
		--Prendo tutte le ricevitorie attive/disattive al servizio
		DECLARE CUR_R2 SCROLL CURSOR FOR
		SELECT lsrser_tel_key_id_ricev, lsrser_tel_stato, lsrser_tel_data_decor, lsrser_tel_note
		FROM lsrser_tel A
		WHERE  lsrser_tel_key_categoria = @Categoria
			AND lsrser_tel_key_servizio = @Servizio
			AND lsrser_tel_key_attivita = @Attivita
			AND lsrser_tel_data_decor =  @Oggi 
			AND lsrser_tel_flag_validita = 'Y'
			AND (lsrser_tel_stato= '1' OR lsrser_tel_stato= '2') 
			--and lsrser_tel_key_id_ricev in ('TO0313') --,'FI0308','FI0450','FI0953','FI1292','FI1392','FI2608','FI3886','FI3892','FI4358','RM2731','RM4024','RM4483','TO0599')
		order by 1
		--print 'TRATTAMENTO TELEFONICI  ' + @codricev +' COD ATTIV: '+@Attivita+ ' NOME SEV: ' + @NOMeServizio + ' TIPO:'+ @TipoMovimentazione + ' CAUSALE ' + @causale		
	END 

	--******************************************************************************
	--- TRATTAMENTO CATEGORIA 02 - SERVIZI AL CITTADINO
	--******************************************************************************
	IF @Categoria = '02'
	BEGIN 
		--print 'CATEGORIA 2'
	        SELECT @STATO = NULL

		DECLARE CUR_R2 SCROLL CURSOR FOR
		SELECT lsrser_citt_key_id_ricev, lsrser_citt_stato, lsrser_citt_data_decor, lsrser_citt_note	
		FROM lsrser_citt A
		WHERE lsrser_citt_key_categoria = @Categoria
			AND lsrser_citt_key_servizio = @Servizio
			AND lsrser_citt_key_attivita = @Attivita
			AND lsrser_citt_data_decor = @Oggi
			AND lsrser_citt_flag_validita = 'Y'
			AND (lsrser_citt_stato = '1' OR lsrser_citt_stato = '2')	
			--and lsrser_citt_key_id_ricev in ('TO0313') --,'FI0308','FI0450','FI0953','FI1292','FI1392','FI2608','FI3886','FI3892','FI4358','RM2731','RM4024','RM4483','TO0599')
		order by 1
		--print 'SERVIZI AL CITTADINO ' + @codricev +' COD ATTIV: '+@Attivita+ ' NOME SEV: ' + @NOMeServizio + ' TIPO:'+ @TipoMovimentazione + ' CAUSALE ' + @causale		
	END 

	--******************************************************************************
	--- TRATTAMENTO CATEGORIA 03 - PAGAMENTO UTENZE
	--******************************************************************************
	IF @Categoria = '03'
	BEGIN 
		--print 'CATEGORIA 3'
	        SELECT @STATO = NULL

		DECLARE CUR_R2 SCROLL CURSOR FOR
		SELECT lsrser_pag_key_id_ricev, lsrser_pag_stato, lsrser_pag_data_decor,lsrser_pag_note
		FROM lsrser_pag A
		WHERE lsrser_pag_key_categoria = @Categoria
			AND lsrser_pag_key_servizio = @Servizio
			AND lsrser_pag_key_attivita = @Attivita
			AND lsrser_pag_data_decor = @Oggi
			AND lsrser_pag_flag_validita = 'Y'
			AND (lsrser_pag_stato = '1' OR  lsrser_pag_stato = '2') 
			--and lsrser_pag_key_id_ricev in ('TO0313') --,'FI0308','FI0450','FI0953','FI1292','FI1392','FI2608','FI3886','FI3892','FI4358','RM2731','RM4024','RM4483','TO0599')
		order by 1
		--print 'PAGAMENTO QUALCOSA ' + @codricev +' COD ATTIV: '+@Attivita+ ' NOME SEV: ' + @NOMeServizio + ' TIPO:'+ @TipoMovimentazione + ' CAUSALE ' + @causale		
	END 

	--******************************************************************************
	--- TRATTAMENTO CATEGORIA 04 - BIGLIETTERIA
	--******************************************************************************
	IF @Categoria = '04'
	BEGIN 
		--print 'CATEGORIA 4'
	        SELECT @STATO = NULL

		DECLARE CUR_R2 SCROLL CURSOR FOR
		SELECT lsrser_big_key_id_ricev, lsrser_big_stato, lsrser_big_data_decor, lsrser_big_note 
		FROM lsrser_big A
		WHERE lsrser_big_key_categoria = @Categoria
			AND lsrser_big_key_servizio = @Servizio
			AND lsrser_big_key_attivita = @Attivita
			AND lsrser_big_data_decor = @Oggi
			AND lsrser_big_flag_validita = 'Y'
			AND (lsrser_big_stato = '1' OR  lsrser_big_stato = '2')
			--and lsrser_big_key_id_ricev in ('TO0313') --,'FI0308','FI0450','FI0953','FI1292','FI1392','FI2608','FI3886','FI3892','FI4358','RM2731','RM4024','RM4483','TO0599')
		order by 1
		--print 'BIGLIETTERIA ' + @codricev +' COD ATTIV: '+@Attivita+ ' NOME SEV: ' + @NOMeServizio + ' TIPO:'+ @TipoMovimentazione + ' CAUSALE ' + @causale		
	END 

	--******************************************************************************
	--- TRATTAMENTO CATEGORIA 05 - ATTI GIUDIZIARI
	--******************************************************************************
	IF @Categoria = '05'
	BEGIN 
		--print 'CATEGORIA 5'
	        SELECT @STATO = NULL

		DECLARE CUR_R2 SCROLL CURSOR FOR
		SELECT lsrser_atti_key_id_ricev, lsrser_atti_stato, lsrser_atti_data_decor, lsrser_atti_note
		FROM lsrser_atti A
		WHERE lsrser_atti_key_categoria = @Categoria
			AND lsrser_atti_key_servizio = @Servizio
			AND lsrser_atti_key_attivita = @Attivita
			AND lsrser_atti_data_decor = @Oggi
			AND lsrser_atti_flag_validita = 'Y'
			AND (lsrser_atti_stato = '1' OR lsrser_atti_stato = '2')
			--and lsrser_atti_key_id_ricev in ('TO0313') --,'FI0308','FI0450','FI0953','FI1292','FI1392','FI2608','FI3886','FI3892','FI4358','RM2731','RM4024','RM4483','TO0599')
		order by 1
		--print 'ATTI QUALCOSA ' + @codricev +' COD ATTIV: '+@Attivita+ ' NOME SEV: ' + @NOMeServizio + ' TIPO:'+ @TipoMovimentazione + ' CAUSALE ' + @causale		
	END 

----------------

	OPEN CUR_R2
	FETCH NEXT FROM CUR_R2
	INTO @CodRicev, @StatoSer, @DataDecorr, @Causale
	
	WHILE @@FETCH_STATUS = 0 
	BEGIN -- 7
		--print 'FETCH_CURSORE_2: ' + @CodRicev + ' ' +  @StatoSer + ' '+  @DataDecorr + ' '+ isnull(@causale,'causale NULLA')
		-- Prendo i dati di ricevitoria
		SELECT 	@Provincia = lsrric_prov_ricev,
			@CodAmm = lsrric_cod_amm,
			@Comune = lsrric_comune_ricev,
			@CodAmm = lsrric_cod_amm,
			@Cap = lsrric_cap,
			@Indirizzo = lsrric_indirizzo,
			@DecodRicev = lsrric_decod_ricev
		FROM 	lsrric
		WHERE 	lsrric_key_id_ricev = @CodRicev 
		AND 	lsrric_flag_validita = 'Y'
		AND 	lsrric_data_validita =
				(SELECT MAX(lsrric_data_validita) 
				FROM lsrric
				WHERE lsrric_data_validita <= @Oggi
				AND lsrric_key_id_ricev = @CodRicev 
				AND lsrric_flag_validita = 'Y')
 		--print 'DATIRICEVITORIA: ' + @Provincia +' '+ @CodAmm +' '+ @Comune +' '+ @CodAmm +' '+ @Cap +' '+ @Indirizzo +' '+ @DecodRicev 

		-- Prendo i dati del titolare
		SELECT 	@Cognome = lsrtit_cognome,
			@Nome = lsrtit_nome
		FROM 	lsrtit
		WHERE 	lsrtit_key_id_ricev = @CodRicev 
		AND 	lsrtit_flag_validita = 'Y'
		AND 	lsrtit_data_validita =
				(SELECT MAX(lsrtit_data_validita) 
				FROM lsrtit
				WHERE lsrtit_data_validita <= @Oggi
				AND lsrtit_key_id_ricev = @CodRicev 
				AND lsrtit_flag_validita = 'Y')
		--print	'DATIRICEVITORE: ' + @Cognome +' '+ @Nome

		select @TipoMovimentazione=  lsrlet_lis_tipo_movimentazione
		from lsrlet_lis 
		where lsrlet_lis_key_id_ricev=@CodRicev
		and lsrlet_lis_key_categoria + lsrlet_lis_key_servizio + lsrlet_lis_key_attivita = @Categoria + @Servizio + @Attivita
		and lsrlet_lis_decor_dal = @DataDecorr
--print 'tipo mov ' + @tipomovimentazione
		if @tipomovimentazione IN ('A','D')
		begin 
			if @causale is null
			begin
				select @causale =  lsrlet_lis_note
				from lsrlet_lis 
				where lsrlet_lis_key_id_ricev = @CodRicev				
				and lsrlet_lis_key_categoria + lsrlet_lis_key_servizio + lsrlet_lis_key_attivita = @Categoria + @Servizio + @Attivita
				and lsrlet_lis_decor_dal = @DataDecorr
			
				--print	'CAUSALE PRESA DA (A,D): ' + isnull(@causale,'causale NULLA')
			end
		end		

		if @tipomovimentazione = 'R'
		begin
			--print 'ENTRO IN R: ' + @CodRicev + '  1' + @ATTIVITA + ' ' + @StatoSer + ' ' + @NomeServizio + ' ' + @TipoMovimentazione + ' ' + isnull(@causale,'causale NULLA')
			if @causale is null 
			begin  
				select @causale = null
				select @doc = null
				select @doc_fk = null

				select 	@doc =lsrlet_lis_nome_tab_documento,
					@doc_fk =lsrlet_lis_fk_tab_documento, 
					@causale = lsrlet_lis_note
				from lsrlet_lis 
				where lsrlet_lis_key_id_ricev =@CodRicev
				and lsrlet_lis_key_categoria + lsrlet_lis_key_servizio + lsrlet_lis_key_attivita = @Categoria+ @Servizio+ @Attivita	   
				and lsrlet_lis_decor_dal = @DataDecorr
				and lsrlet_lis_nome_tab_documento in ('','LSRRAD_LIS')
/*
select 	lsrlet_lis_key_id_ricev,lsrlet_lis_nome_tab_documento,
	lsrlet_lis_fk_tab_documento, 
	lsrlet_lis_note
	from lsrlet_lis 
	where lsrlet_lis_key_id_ricev IN ('MI2119','RM0564','RM0843','RM1669')
				and lsrlet_lis_key_categoria + lsrlet_lis_key_servizio + lsrlet_lis_key_attivita = '030101'
				and lsrlet_lis_decor_dal = '20030423'
				and lsrlet_lis_nome_tab_documento in ('','LSRRAD_LIS')

*/
				
				--print 'DATI DOCUMENTO: ' + @doc + ' ' + @doc_fk + ' ' + isnull(@causale,'causale NULLA')
				
				if @doc = 'LSRRAD_LIS' and @causale is null
				begin 
					select  @lost = lsrrad_lis_causale_lis,
						@causale = case lsrrad_lis_causale_lis 
						when 0 then 'RISOLUZIONE INADEMPIENZE'
						when 1 then 'ACQUISIZIONE FIDEJUSSIONE'
						when 2 then 'ACQUISIZIONE RID'
						when 3 then 'COMPLETAMENTO DOCUMENTAZIONE'
						when 4 then 'ANNULLAMENTO RINUNCIA SERVIZIO'
						when 5 then 'ANNULLAMENTO DISDETTA/REVOCA SERVIZIO'
						when 6 then 'AGENZIA ENTRATE'
					end 
					from lsrrad_lis
					where lsrrad_lis_key_data_ins + lsrrad_lis_key_ora_ins = @doc_fk
					
					--print 'CAUSALE TROVATA SU LSRRAD_LIS: ' + isnull(@lost,'causale NULLA')
				end
			end 
			--print	'CAUSALE PRESA DA R: ' + isnull(@causale,'causale NULLA')
		end

		IF @CAUSALE IS NULL 
		BEGIN
			select @causale = lsrlet_lis_note
			from lsrlet_lis 
			where lsrlet_lis_key_id_ricev = @CodRicev
			and lsrlet_lis_key_categoria + lsrlet_lis_key_servizio + lsrlet_lis_key_attivita = @Categoria+ @Servizio+ @Attivita    
			and lsrlet_lis_decor_dal = @DataDecorr
			and lsrlet_lis_nome_tab_documento NOT in ('','LSRRAD_LIS')
		END

		--print 'PRIMA DI INSERT: ' + @CodRicev + '  ' + @ATTIVITA + ' ' + @StatoSer + ' ' + @NomeServizio + ' ' + @TipoMovimentazione + ' ' + isnull(@causale,'causale NULLA')

		-- Inserisco il report nella tabella 
		INSERT INTO report_lis_tmp
		VALUES(	
			@CodRicev,
			@CodAmm,
			@NomeServizio,
			@DecodRicev,
			@Cognome,
			@Nome,
			@DataDecorr,
			@StatoSer,
			@TipoMovimentazione,
			@Causale
		)
	
		IF @@error <> 0 
		BEGIN
			RETURN
		END
		
		FETCH NEXT FROM CUR_R2		
		INTO @CodRicev, @StatoSer, @DataDecorr, @causale 
	
	END -- CURSORE 2

	CLOSE CUR_R2
	DEALLOCATE CUR_R2
	
	FETCH NEXT FROM CUR_R1		
	INTO @Categoria, @Servizio, @Attivita, @CodServizio, @NomeServizio

END -- CURSORE 1

CLOSE CUR_R1
DEALLOCATE CUR_R1
GO
