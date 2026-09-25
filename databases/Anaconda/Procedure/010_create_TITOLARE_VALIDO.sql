/****** Object:  StoredProcedure [dbo].[TITOLARE_VALIDO]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[TITOLARE_VALIDO]
	@Ricev 		char(6),
	@DataRic	     	char(8),
	@CognomeNome	varchar(50) output
AS

DECLARE	@CognomeTit		char(24),
		@NomeTit		char(20),
		@TipoProvv		char(1),
		@TitTrovato		char(1)

select @CognomeNome = ''
select @CognomeNome = lsrtit_cognome + ' / '  + lsrtit_nome
from lsrtit 
where  (lsrtit_data_validita + lsrtit_ora_validita) = 
	(select max((lsrtit_data_validita + lsrtit_ora_validita)) from lsrtit 
	where lsrtit_key_id_ricev =@Ricev
	and  lsrtit_data_validita <= @DataRic
	and  lsrtit_flag_validita = 'Y')
and  lsrtit_key_id_ricev = @Ricev
and  lsrtit_flag_validita = 'Y'

IF @@ROWCOUNT <> 0
begin 
 	DECLARE CUR_R1 SCROLL CURSOR FOR
	SELECT lsrtit_cognome, lsrtit_nome, lsrtit_tipo_provv
	FROM lsrtit
	WHERE lsrtit_key_id_ricev=@Ricev AND
	  	lsrtit_data_validita >= @DataRic
		and  lsrtit_flag_validita = 'Y' 
	ORDER BY lsrtit_data_validita 
  
	SELECT @TitTrovato = 'N'

	OPEN CUR_R1

	FETCH NEXT FROM CUR_R1
	INTO @CognomeTit, @NomeTit, @TipoProvv
	WHILE @@FETCH_STATUS = 0 and @TitTrovato = 'N'
	BEGIN
		
 		IF @TipoProvv <> 'I'
		begin
			select @CognomeNome = @CognomeTit + ' / ' + @NomeTit
		end 
		else 
		begin
			select @TitTrovato = 'Y'
--			print @cognomenome
		end
		
		
		FETCH NEXT FROM CUR_R1
		INTO @CognomeTit, @NomeTit,  @TipoProvv
	END

	CLOSE CUR_R1
	DEALLOCATE CUR_R1
end
else
begin
	SELECT @CognomeNome = lsr02a_cognome+ ' / ' + lsr02a_nome
	FROM lsr02a a
	WHERE  lsr02a_key_id_ricev = (
		select lsr02a_key_id_ricev
		from lsr02a b
		where a.lsr02a_key_id_ricev = b.lsr02a_key_id_ricev
		group by lsr02a_key_id_ricev
		having count(lsr02a_key_id_ricev) = 1
		)	
	AND lsr02a_key_id_ricev = @ricev
--	print @cognomenome 
end


if  @CognomeNome = ' / ' 
begin 
	select @CognomeNome = ''
end

--print ' Trovato - ' + @cognomenome
GO
