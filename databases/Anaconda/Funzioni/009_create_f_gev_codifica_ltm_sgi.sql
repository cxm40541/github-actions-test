/****** Object:  UserDefinedFunction [dbo].[f_gev_codifica_ltm_sgi]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  function [dbo].[f_gev_codifica_ltm_sgi]  (@cod_ltm varchar(6))
returns varchar(7)
as
begin
 declare @cod_sgi varchar(7)
 
 select @cod_sgi = 
  case when substring(@cod_ltm,3,4) > '9999' 
    then isnull(rete_sgi_oversize,'') + substring(@cod_ltm,3,4)
    else isnull(rete_sgi,'') + substring(@cod_ltm,3,4)
  end
 from gev_decod_ltm_sgi
 where rete_ltm = substring(@cod_ltm,1,2)
 
 return @cod_sgi 
end
GO
