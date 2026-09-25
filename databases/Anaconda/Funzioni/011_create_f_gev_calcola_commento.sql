/****** Object:  UserDefinedFunction [dbo].[f_gev_calcola_commento]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  function [dbo].[f_gev_calcola_commento]  (
       @catena varchar(10) = null
      ,@ricevitoria varchar(7) = null
)
returns char(40)
as
begin
      declare @commento char(40)
      select @commento = SPACE(40)
      IF RTRIM(LTRIM(@catena)) = 'POSM'
      BEGIN
          select   @commento = left(isnull(lsrcon_GeV_cod_fisc,'') + SPACE(40), 40)
          from     dbo.lsrcon_GeV
          where    lsrcon_GeV_flag_anag = '1'
          and      lsrcon_GeV_cod_lotto = @ricevitoria
      END 
      return @commento
end
GO
