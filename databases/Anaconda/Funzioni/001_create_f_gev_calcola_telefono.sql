/****** Object:  UserDefinedFunction [dbo].[f_gev_calcola_telefono]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE   function [dbo].[f_gev_calcola_telefono]  (
       @telefono varchar(12) = null
)
returns char(12)
as
begin
      declare @telefonoOUT char(12)
      if @telefono is null 
      begin
            set @telefonoOUT = replicate('0',12)
      end
      else 
      begin
            set @telefono = replace(@telefono,'/','')
            set @telefono = replace(@telefono,'-','')
            set @telefono = replace(@telefono,'.','')
            set @telefonoOUT = left(rtrim(ltrim(@telefono)) + replicate(' ',12),12)
      end
      return @telefonoOUT 
end
GO
