/****** Object:  UserDefinedFunction [dbo].[S2T_convert_FROM_base10]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[S2T_convert_FROM_base10] (@num INT, @base TINYINT)
RETURNS VARCHAR(255) AS 
BEGIN 
  -- Declarations
  DECLARE @string VARCHAR(255)
  DECLARE @return VARCHAR(255)
  DECLARE @finished BIT
  DECLARE @div INT
  DECLARE @rem INT
  DECLARE @char CHAR(1)

  -- Initialise
  SELECT @string   = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'
  SELECT @return   = CASE WHEN @num <= 0 THEN '0' ELSE '' END
  SELECT @finished = CASE WHEN @num <= 0 THEN 1 ELSE 0 END
  SELECT @base     = CASE WHEN @base < 2 OR @base IS NULL THEN 2 WHEN @base > 36 THEN 36 ELSE @base END

  -- Loop
  WHILE @finished = 0
  BEGIN

    -- Do the maths
    SELECT @div = @num / @base
    SELECT @rem = @num - (@div * @base)
    SELECT @char = SUBSTRING(@string, @rem + 1, 1)
    SELECT @return = @char + @return
    SELECT @num = @div

    -- Nothing left?
    IF @num = 0 SELECT @finished = 1

  END

  -- Done
  RETURN @return

END
GO
