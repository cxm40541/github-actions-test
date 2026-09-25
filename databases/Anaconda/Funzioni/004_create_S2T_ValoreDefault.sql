/****** Object:  UserDefinedFunction [dbo].[S2T_ValoreDefault]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[S2T_ValoreDefault]
(
	@campo_in varchar(30)
)
RETURNS varchar(1000)
AS
BEGIN
	declare @valoreout varchar(1000)
	select @valoreout = valore_default
	from dbo.S2T_valori_default
	where rtrim(ltrim(campo)) = rtrim(ltrim(@campo_in))
	return @valoreout
END
GO
