/****** Object:  StoredProcedure [dbo].[RepMovimentazioniCONI]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE     PROCEDURE [dbo].[RepMovimentazioniCONI]
	@DATA_REP		CHAR(8),
	@XML 			CHAR(1),
	@ESITO 			INT OUT
AS

DECLARE	@Stato			char(1),
        @Oggi			char(8),
	@Ora			char(8),
	@DataDecorr		char(8), 
	@StatoSer		char(1),
	@CodRicev		char(6),
	@CodRicevPrec	char(6),
	@CodAmm		char(6),
	@NomeOld		char(20),
	@CognomeOld		char(24),
	@Nome			char(20),
	@Cognome		char(24),
	@tipomovimentazione	char(1),
	@causale		char(50),
	@causalePrec		char(50),
	@nometabdoc		char(15),
	@fktabdoc		char(16),
	@Tipologia		char(20),
	@DataValidita		char(8),
	@FONTE			CHAR(1),
	@CAUSALELOTTOMATICA	CHAR(1),
	@totrec 		int,
        @Note			char(150)
	

SELECT @ESITO = 0

if exists (select * from dbo.sysobjects where id = object_id(N'##lsrser_coni_report') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table  ##lsrser_coni_report

CREATE TABLE ##lsrser_coni_report (
	[prg] [int] IDENTITY (1, 1) NOT NULL ,
	[cod_lottomatica] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cod_amm] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cognome_old] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[nome_old] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[cognome] [char] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[nome] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[causale] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[data_decorr] [char] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL ,
	[Tipologia] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL 
)



--SELECT @Oggi = CONVERT(CHAR,GETDATE(),112) + 1
SELECT @Oggi = CONVERT(CHAR,GETDATE(),112)
SELECT @Ora = SUBSTRING(CONVERT(CHAR,GETDATE(),121),12,2) + 
		SUBSTRING(CONVERT(CHAR,GETDATE(),121),15,2) +
		SUBSTRING(CONVERT(CHAR,GETDATE(),121),18,2) +
		SUBSTRING(CONVERT(CHAR,GETDATE(),121),21,2)

--INIZIALIZZAZIONI
select @CognomeOld = ''
SELECT @nomeOld = ''
select @CodAmm = ''
select @Cognome = ''
select @nome = ''
select @DataValidita = ''
select @causale = ''
SELECT @CodRicevPrec = ''
select @totrec = 0

DECLARE CUR_R1 SCROLL CURSOR FOR

SELECT  lsrlet_coni_key_id_ricev, 
lsrlet_coni_tipo_movimentazione ,
lsrlet_coni_nome_tab_documento ,
lsrlet_coni_fk_tab_documento ,
lsrlet_coni_note
from lsrlet_coni
where lsrlet_coni_decor_dal = @DATA_REP
order by 1
OPEN CUR_R1
FETCH NEXT FROM CUR_R1
INTO @CodRicev, @tipomovimentazione, @nometabdoc, @fktabdoc, @causale

WHILE @@FETCH_STATUS = 0 
BEGIN
	select @totrec = @totrec + 1

	-- MI serve per gestire il fatto che posso avere più di un 
	-- record per ogni ric su lsrlet, e quindi scrivo solo l'ultimo letto
	-- di ogni gruppo di ric
	if @CodRicevPrec <> @CodRicev and @CodRicevPrec<> ''
	begin
		-- Inserisco il report nella tabella 
		INSERT INTO  ##lsrser_coni_report 
		VALUES(@CodRicevPrec,
			@CodAmm,
			@cognomeold,
			@nomeold,
			@cognome,
			@nome,
			@causalePrec,
			@DATA_REP,
			@Tipologia		
		)
		IF @@error <> 0 
		BEGIN
			RETURN
		END
		
		select @causalePrec = ''

	end


	select @CognomeOld = ''
	SELECT @nomeOld = ''
	select @CodAmm = ''
	select @Cognome = ''
	select @nome = ''
	select @DataValidita = ''

	IF @tipomovimentazione = 'A' 
	BEGIN
		SELECT @Tipologia = 'ATTIVAZIONE'
	END	
	IF @tipomovimentazione = 'D' 
	BEGIN
		SELECT @Tipologia = 'DISATTIVAZIONE'
	END	
	IF @tipomovimentazione = 'R' 
	BEGIN
		SELECT @Tipologia = 'RIATTIVAZIONE'
	END	

	--PRENDO I DATI DEL TITOLARE ATTUALE
	select @CodAmm = lsrric_cod_amm,
	 	@Cognome = lsrtit_coni_cognome,
	 	@nome = lsrtit_coni_nome,
		@DataValidita = lsrtit_coni_data_validita
	from lsrric join lsrtit_coni 
	on lsrric_key_id_ricev = lsrtit_coni_key_id_ricev 
	where lsrric_key_id_ricev = @CodRicev
		and (lsrric_data_validita + lsrric_ora_validita) = 
			(select max(lsrric_data_validita + lsrric_ora_validita) from lsrric 
			where lsrric_key_id_ricev = @CodRicev
		 	and  lsrric_data_validita <= @DATA_REP
		 	and  lsrric_flag_validita = 'Y')
		and (lsrtit_coni_data_validita + lsrtit_coni_ora_validita) = 
			(select max((lsrtit_coni_data_validita + lsrtit_coni_ora_validita)) from lsrtit_coni 
			where lsrtit_coni_key_id_ricev = @CodRicev
	 		and  lsrtit_coni_data_validita <= @DATA_REP
	 		and  lsrtit_coni_flag_validita = 'Y')
	 	and  lsrric_key_id_ricev = @CodRicev
		and  lsrric_flag_validita = 'Y'
	 	and  lsrtit_coni_flag_validita = 'Y'

	IF (@nometabdoc = 'LSRRAD_coni')
	BEGIN
		SELECT @FONTE = lsrrad_coni_fonte, 
			@CAUSALELOTTOMATICA = lsrrad_coni_causale_lottomatica 
		FROM lsrrad_coni 
		WHERE lsrrad_coni_KEY_ID_RICEV =  @CodRicev
			AND lsrrad_coni_KEY_DATA_INS + lsrrad_coni_KEY_ORA_INS = @fktabdoc

		IF @FONTE = 'A'
		BEGIN
			SELECT @causale = 'ASSOCIAZIONE ' + @causale 
		END
		IF @FONTE = 'M'
		BEGIN
			SELECT @causale = 'Monopoli ' + @causale 
		END
		IF @FONTE = 'L'
		BEGIN
			
			IF  @CAUSALELOTTOMATICA = '0'
			BEGIN
			    if (@tipomovimentazione = 'D') 
				
				SELECT @causale = 'INSOLUTI RID'
			   
			    if (@TIPOMOVIMENTAZIONE = 'R') 			  
				SELECT @causale = 'RISOLUZIONE INADEMPIENZE'
			END
				   
			IF  @CAUSALELOTTOMATICA = '1'
			BEGIN
			    if (@TIPOMOVIMENTAZIONE = 'D') 
				SELECT @causale = 'SOTTO DISTANZA'
		   
			    if (@TIPOMOVIMENTAZIONE = 'R') 
				SELECT @causale = 'ANNULLAMENTO SOTTO DISTANZA'		      
		  	END

			IF  @CAUSALELOTTOMATICA = '2' 
			BEGIN
		 	   if (@TIPOMOVIMENTAZIONE = 'D') 
				SELECT @causale = 'SDOPPIAMENTO CODICE'
		     
			    if (@TIPOMOVIMENTAZIONE = 'R') 
				SELECT @causale = 'SDOPPIAMENTO CODICE'
		     	END

			IF  @CAUSALELOTTOMATICA = '4' 
			BEGIN
			    if (@TIPOMOVIMENTAZIONE = 'D') 
				SELECT @causale = 'ERRATA ASSOCIAZIONE CODICE'
		     
			    if (@TIPOMOVIMENTAZIONE = 'R') 
				SELECT @causale = 'ERRATA ASSOCIAZIONE CODICE'
			END

			IF  @CAUSALELOTTOMATICA =  '5' 
			BEGIN
				SELECT @causale = 'SANATORIA '
			END

			IF  @CAUSALELOTTOMATICA = '6' 
			BEGIN
			    if (@TIPOMOVIMENTAZIONE = 'D') 
				SELECT @causale = 'CONTRATTUALISTICA INCOMPLETA'
		     
			    if (@TIPOMOVIMENTAZIONE = 'R') 
				SELECT @causale = 'ONTRATTUALISTICA COMPLETA'
			END
			IF  @CAUSALELOTTOMATICA = '7' 
			BEGIN
			    if (@TIPOMOVIMENTAZIONE = 'D') 
				SELECT @causale = 'CESSAZIONE FIDEIUSSIONE'
		     
			    if (@TIPOMOVIMENTAZIONE = 'R') 
				SELECT @causale = 'RIPRISTINO FIDEIUSSIONE'
			END
			IF  @CAUSALELOTTOMATICA = '8' 
			BEGIN
			    if (@TIPOMOVIMENTAZIONE = 'D') 
				SELECT @causale = 'RINUNCIA'
		     
			    if (@TIPOMOVIMENTAZIONE = 'R') 
				SELECT @causale = 'ANULLAMENTO RINUNCIA'
			END
			IF  @CAUSALELOTTOMATICA = '9' 
			BEGIN
			    if (@TIPOMOVIMENTAZIONE = 'D') 
				SELECT @causale = 'CAMBIO CODICE LOTTO'
		     
			    if (@TIPOMOVIMENTAZIONE = 'R') 
				SELECT @causale = 'CAMBIO CODICE LOTTO'
			END
		END

	END
	ELSE IF (@nometabdoc = 'LSRPRO')
	BEGIN
		SELECT @causale = 'CAMBIO TITOLARE'
		SELECT @CognomeOld = ''
		SELECT @nomeOld = ''
		--PRENDO I DATI DEL TITOLARE PRECEDENTE
		select @CognomeOld = lsrtit_coni_cognome,
		 	@nomeOld = lsrtit_coni_nome
		from lsrtit_coni 
		where lsrtit_coni_key_id_ricev = @CodRicev
			and (lsrtit_coni_data_validita + lsrtit_coni_ora_validita) = 
				(select max((lsrtit_coni_data_validita + lsrtit_coni_ora_validita)) from lsrtit_coni 
				where lsrtit_coni_key_id_ricev = @CodRicev
		 		and  lsrtit_coni_data_validita < @DataValidita
		 		and  lsrtit_coni_flag_validita = 'Y')
		 	and  lsrtit_coni_flag_validita = 'Y'
		IF (@CognomeOld = '')
		BEGIN
			SELECT @causale = 'CESSAZIONE TITOLARE'
		END
	
	END
	
	select @CodRicevPrec = @CodRicev
	if (@causale <> '')
		select @causalePrec = @causale

	FETCH NEXT FROM CUR_R1		
	INTO @CodRicev, @tipomovimentazione, @nometabdoc, @fktabdoc, @causale
	

END -- While

CLOSE CUR_R1
DEALLOCATE CUR_R1

-- Inserisco l'ultimo record nella tabella 
if (@totrec > 0)
begin 
	INSERT INTO  ##lsrser_coni_report 
	VALUES(@CodRicevPrec,
		@CodAmm,
		@cognomeold,
		@nomeold,
		@cognome,
		@nome,
		@causalePrec,
		@DATA_REP,
		@Tipologia		
	)
	IF @@error <> 0 
	BEGIN
		RETURN
	END
end	

select  isnull(prg,'') as PRG,
	isnull(cod_lottomatica,'') as CodLott,
	isnull(cod_amm,'') as CodAmm,
	isnull((cognome_old + nome_old),'') as VecchioTit,
	isnull(cognome + nome,'') as NuovoTit,
	isnull(causale,'') as Causale,
	isnull(data_decorr,'') as DataDecorr,
	isnull(Tipologia,'') as Tipologia
from ##lsrser_coni_report
FOR XML RAW
RETURN @ESITO
GO
