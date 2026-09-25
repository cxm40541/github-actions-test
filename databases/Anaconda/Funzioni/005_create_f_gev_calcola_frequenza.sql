/****** Object:  UserDefinedFunction [dbo].[f_gev_calcola_frequenza]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  function [dbo].[f_gev_calcola_frequenza]  (

       @catena varchar(3) = null

      ,@classe varchar(1)

      ,@operatore varchar(3)

)

returns char(2)

as

begin

      declare @frequenza char(2)

      set @frequenza = '  '

 

      set @operatore = replace(@operatore,'0',' ')

      set @operatore = replace(@operatore,'1',' ')

      set @operatore = replace(@operatore,'2',' ')

      set @operatore = replace(@operatore,'3',' ')

      set @operatore = replace(@operatore,'4',' ')

      set @operatore = replace(@operatore,'5',' ')

      set @operatore = replace(@operatore,'6',' ')

      set @operatore = replace(@operatore,'7',' ')

      set @operatore = replace(@operatore,'8',' ')

      set @operatore = replace(@operatore,'9',' ')

 

      if @catena is null 

      begin

            select @frequenza = isnull(Frequenza,'  ')

            from dbo.GEV_Decod_Frequenza

            where rtrim(ltrim(catena)) = ''

            and classe = @classe

            and operatore = @operatore

            if @@rowcount = 0

            begin

                  select @frequenza = isnull(Frequenza,'  ')

                  from dbo.GEV_Decod_Frequenza

                  where rtrim(ltrim(catena)) = ''

                  and classe = @classe

                  and rtrim(ltrim(operatore)) = ''

            end

      end 

      else 

      begin

            select @frequenza = isnull(Frequenza,'  ')

            from dbo.GEV_Decod_Frequenza

            where catena = @catena

            and classe = @classe

            and operatore = @operatore

            if @@rowcount = 0

            begin

                  select @frequenza = isnull(Frequenza,'  ')

                  from dbo.GEV_Decod_Frequenza

                  where rtrim(ltrim(catena)) = ''

                  and classe = @classe

                  and rtrim(ltrim(operatore)) = ''

            end

      end 

 

      return @frequenza 

end
GO
