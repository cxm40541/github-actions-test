/****** Object:  UserDefinedFunction [dbo].[f_gev_codifica_sgi_ltm]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[f_gev_codifica_sgi_ltm] (@cod_sgi varchar(7))

 

returns varchar(6)

as

begin

-- declare @cod_sgi varchar(7)

-- set @cod_sgi = '9002446'

 declare @cod_ltm varchar(6)

 

 select @cod_ltm = isnull(rete_ltm,'') + substring(@cod_sgi,4,4)

 from gev_decod_ltm_sgi

 where rete_sgi = substring(@cod_sgi,1,3)

-- print @cod_ltm

      

 return @cod_ltm 

end
GO
