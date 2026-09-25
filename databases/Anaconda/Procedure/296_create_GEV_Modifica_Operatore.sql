/****** Object:  StoredProcedure [dbo].[GEV_Modifica_Operatore]    Script Date: 11/17/2025 15:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  procedure [dbo].[GEV_Modifica_Operatore] 
	@ricev			varchar(6) = null,
	@tsr 			varchar(3) = null,
	@classe			varchar(1) = null,
	@contatto		varchar(1) = null
as
begin
	---------------------------------------------------------------
	if (@ricev is null) or (rtrim(ltrim(@ricev)) = '')
	begin
		raiserror ('Selezionare Ricevitoria.',16,1)
		return 1000
	end
	---------------------------------------------------------------
	if (@tsr is null) or (rtrim(ltrim(@tsr)) = '')
	begin
		select @tsr = null
	end
	---------------------------------------------------------------
	if (@classe is null) or (rtrim(ltrim(@classe)) = '')
	begin
		select @classe = null
	end
	---------------------------------------------------------------
	if (@contatto is null) or (rtrim(ltrim(@contatto)) = '')
	begin
		select @contatto = null
	end
	---------------------------------------------------------------
	update dbo.lsrpvo
	set  lsrpvo_operatore   = isnull(@tsr, lsrpvo_operatore)
		,lsrpvo_classe      = isnull(@classe, lsrpvo_classe)
		,lsrpvo_gg_contatto = isnull(@contatto, lsrpvo_gg_contatto)
	where lsrpvo_key_id_ricev = @ricev
	---------------------------------------------------------------
end
GO
