/****** Object:  StoredProcedure [dbo].[Gev_Copia_Profilo_Ricevitoria]    Script Date: 11/17/2025 15:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Gev_Copia_Profilo_Ricevitoria] ( 
        @ricev_new varchar(6) = null
       ,@ricev_old varchar(6) = null
)
as
begin 
        if @ricev_new is null or rtrim(ltrim(@ricev_new)) = '' 
        begin
			raiserror('Errore: Ricevitoria Nuova assente.',16,1)
			return 999
        end

        if @ricev_old is null or rtrim(ltrim(@ricev_old)) = '' 
        begin
			raiserror('Errore: Ricevitoria Precedente assente.',16,1)
			return 999
        end

		declare @ctrl int
		select @ctrl = 0
		select @ctrl = count(*) 
		from anaconda.dbo.lsrpvo
		where lsrpvo_key_id_ricev = @ricev_new	

        if @ctrl = 0
        begin
			raiserror('Errore: Profilo Ricevitoria Nuova assente.',16,1)
			return 999
        end

		select @ctrl = 0
		select @ctrl = count(*) 
		from anaconda.dbo.lsrpvo
		where lsrpvo_key_id_ricev = @ricev_old

        if @ctrl = 0
        begin
			raiserror('Errore: Profilo Ricevitoria Precedente assente.',16,1)
			return 999
        end

		select @ricev_new as ricev
			  ,lsrpvo_classe as classe 
			  ,lsrpvo_operatore as operatore
              ,lsrpvo_gg_contatto as giorno
		into   #tmpupdate
		from   anaconda.dbo.lsrpvo
		where  lsrpvo_key_id_ricev = @ricev_old

		update anaconda.dbo.lsrpvo
		set    lsrpvo_classe = classe 
			  ,lsrpvo_operatore = operatore 
              ,lsrpvo_gg_contatto = giorno
		from   anaconda.dbo.lsrpvo, #tmpupdate
		where  lsrpvo_key_id_ricev = ricev
end
GO
