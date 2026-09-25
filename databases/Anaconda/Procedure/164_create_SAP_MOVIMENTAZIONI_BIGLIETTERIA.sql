/****** Object:  StoredProcedure [dbo].[SAP_MOVIMENTAZIONI_BIGLIETTERIA]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE  PROCEDURE [dbo].[SAP_MOVIMENTAZIONI_BIGLIETTERIA]  
	@RC		 		CHAR(70)  OUTPUT


AS

DECLARE
@RICEV		CHAR(6),
@RICEVAPPO	char(10),
@stato		char(11),
@descrizione	char(50),
@categoria 	CHAR(2),
@servizio 	CHAR(2),
@attivita  	CHAR(2),
@DATADOMANI	CHAR(8),
@DATA1	CHAR(8),
@DATA2	CHAR(8),
@DATA3	CHAR(8),
@DATA4	CHAR(8),
@data_decor 	CHAR(8),
@max_data_decor 	CHAR(8),

@MSGERR		VARCHAR(100)

select @DATADOMANI =  CONVERT(CHAR,GETDATE() + 1,112)

DECLARE CUR_CON CURSOR FOR 
SELECT distinct(substring(Cliente,1,6)) from dbo.SAP_Contr_Big where flag_elab = 'N'

OPEN CUR_CON FETCH NEXT FROM CUR_CON INTO @RICEV WHILE @@FETCH_STATUS = 0 

BEGIN
	--print (@RICEV)
/*	
	select @RICEVAPPO=substring(cliente,1,6),
		@stato = stato, 
		@descrizione = descrizione 
	from SAP_Contr_Big
	where cliente = (select max(cliente) from SAP_Contr_Big where cliente like @ricev + '%')
		and flag_elab = 'N'
*/
-- Modifica del 26/10/2009 : Commentata la query sopra e sostituita con quella sotto

	select @RICEVAPPO=substring(cliente,1,6),
		@stato = stato, 
		@descrizione = descrizione 
	from SAP_Contr_Big A
	where cliente = (select max(cliente) 
			from SAP_Contr_Big 
			where cliente like @ricev + '%')
		and flag_elab = 'N'
		and tipo_contratto = (
			select max(tipo_contratto) 
			from SAP_Contr_Big where cliente =A.cliente
		)

	--print (@RICEVAPPO)
	--print @stato
	--print @descrizione

	--VERIFICO SE HO UNA DISATTIVAZIONE 
	if @stato > '00000000002' 
	BEGIN

		DECLARE CUR_BIG CURSOR FOR 
		select lsrser_Big_key_categoria,
			lsrser_Big_key_servizio, 
			lsrser_Big_key_attivita 
	 	from lsrser_Big A
		where lsrser_Big_key_id_ricev = @RICEVAPPO
		 	and  lsrser_Big_data_decor = 
				(select max(lsrser_Big_data_decor) from lsrser_Big 
				where lsrser_Big_key_id_ricev = @RICEVAPPO
		 		and  lsrser_Big_data_decor <= CONVERT(CHAR,GETDATE(),112)
			 	and  lsrser_Big_key_categoria + lsrser_Big_key_servizio + lsrser_Big_key_attivita = A.lsrser_Big_key_categoria + A.lsrser_Big_key_servizio + A.lsrser_Big_key_attivita 
	 			and  lsrser_Big_flag_validita = 'Y')
		 	and  lsrser_Big_flag_validita = 'Y'
		 	and  lsrser_Big_stato = '1'

		OPEN CUR_BIG FETCH NEXT FROM CUR_BIG INTO @categoria, @servizio, @attivita WHILE @@FETCH_STATUS = 0 
		begin
--print @categoria
--print @servizio
--print @attivita
			select @MSGERR = ''
			execute DISATTIVAZIONE_BIG_LIS @RICEVAPPO, @categoria, @servizio, @attivita, @DATADOMANI, 'SAP', 'DISATTIVAZIONE_SAP', @MSGERR OUTPUT
			--print substring(@MSGERR,1,4)
			if substring(@MSGERR,1,4) = '0000'
			begin
				update SAP_Contr_Big
				set flag_elab = 'Y'
				where cliente like @ricev + '%'
			end
			FETCH NEXT FROM CUR_BIG INTO @categoria, @servizio, @attivita

		end
		CLOSE CUR_BIG
		DEALLOCATE CUR_BIG

	END
/*
	--VERIFICO SE HO UNA RIATTIVAZIONE 
	if @stato = '00000000002' 
	BEGIN
		-- Prendo la data di decorrenza della max disattivazione (@max_data_decor) 
		-- che non sia dovuta a un provvedimento I R S
		SELECT @max_data_decor = ''
		SELECT @max_data_decor = MAX(LSRSER_BIG_DATA_DECOR) 
		FROM LSRSER_BIG B 
		WHERE LSRSER_BIG_FT_VOS <> '00000000' 
		 AND LSRSER_BIG_FLAG_VALIDITA = 'Y' 
		 AND LSRSER_BIG_STATO = '2' 
		 AND LSRSER_BIG_KEY_ID_RICEV =  @RICEVAPPO
		 and LSRSER_BIG_TIPO_PROVV <> 'I'
		 and LSRSER_BIG_TIPO_PROVV <> 'R'
		 and LSRSER_BIG_TIPO_PROVV <> 'S'

		-- Verifico se il punto vendita è disattivo
		DECLARE CUR_BIG CURSOR FOR 
		select lsrser_Big_key_categoria,
			lsrser_Big_key_servizio, 
			lsrser_Big_key_attivita,
			lsrser_Big_data_decor
	 	from lsrser_Big A
		where lsrser_Big_key_id_ricev = @RICEVAPPO
		 	and  lsrser_Big_data_decor = 
				(select max(lsrser_Big_data_decor) from lsrser_Big 
				where lsrser_Big_key_id_ricev = @RICEVAPPO
		 		and  lsrser_Big_data_decor <= CONVERT(CHAR,GETDATE(),112)
			 	and  lsrser_Big_key_categoria + lsrser_Big_key_servizio + lsrser_Big_key_attivita = A.lsrser_Big_key_categoria + A.lsrser_Big_key_servizio + A.lsrser_Big_key_attivita 
	 			and  lsrser_Big_flag_validita = 'Y')
		 	and  lsrser_Big_flag_validita = 'Y'
		 	and  lsrser_Big_stato = '2'


		OPEN CUR_BIG FETCH NEXT FROM CUR_BIG INTO @categoria, @servizio, @attivita, @data_decor WHILE @@FETCH_STATUS = 0 
		begin
print @categoria
print @servizio
print @attivita
			
			select @DATA1 = ''
			select @DATA2 = ''
			select @DATA3 = ''

			--Prendo la data di decorrenza dell'ultima attivazione (data1)
			SELECT @DATA1 = MAX(LSRSER_BIG_DATA_DECOR) 
			FROM LSRSER_BIG B 
			WHERE LSRSER_BIG_FT_VOS <> '00000000' 
			 AND LSRSER_BIG_FLAG_VALIDITA = 'Y' 
			 AND LSRSER_BIG_STATO = '1' 
			 AND LSRSER_BIG_KEY_ID_RICEV =  @RICEVAPPO
			 and lsrser_Big_key_categoria = @categoria
			 and lsrser_Big_key_servizio = @servizio
			 and lsrser_Big_key_attivita = @attivita			

 
			-- verifico se c'è una disattivazione da cambio intestazione
			-- con data decorrenza maggiore dell'ultima attivazione  
			SELECT @DATA2 = max(LSRSER_BIG_DATA_DECOR)  
			FROM LSRSER_BIG B 
			WHERE LSRSER_BIG_FT_VOS <> '00000000' 
			 AND LSRSER_BIG_FLAG_VALIDITA = 'Y' 
			 AND LSRSER_BIG_STATO = '2' 
			 AND LSRSER_BIG_KEY_ID_RICEV =  @RICEVAPPO
			 and lsrser_Big_key_categoria = @categoria
			 and lsrser_Big_key_servizio = @servizio
			 and lsrser_Big_key_attivita = @attivita			
			 and LSRSER_BIG_DATA_DECOR > @DATA1
			 and LSRSER_BIG_TIPO_PROVV = 'I'

 			-- SE: 
			-- 1 - NON ho un cambio intestazione superiore a @max_data_decor
			-- 2 - la data di decorrenza della disattivazione è uguale alla @max_data_decor
			--     cioè non è stata disattivata in precedenza per altri motivi
			-- ALLORA posso riattivare
			if @DATA2 < @max_data_decor and @data_decor = @max_data_decor
			begin
				select @MSGERR = ''
				execute RIATTIVAZIONE_BIG_LIS @RICEVAPPO, @categoria, @servizio, @attivita, @DATADOMANI, 'SAP', 'RIATTIVAZIONE_SAP', @MSGERR OUTPUT
				print substring(@MSGERR,1,4)
				if substring(@MSGERR,1,4) = '0000'
				begin
					update SAP_Contr_Big
					set flag_elab = 'Y'
					where cliente like @ricev + '%'
				end
			end
			FETCH NEXT FROM CUR_BIG INTO @categoria, @servizio, @attivita, @data_decor

		end
		CLOSE CUR_BIG
		DEALLOCATE CUR_BIG


	END

*/
	FETCH NEXT FROM CUR_CON INTO @RICEV
	
END


SELECT @RC = '0'
CLOSE CUR_CON
DEALLOCATE CUR_CON
GO
