/****** Object:  UserDefinedFunction [dbo].[S2T_convert_TO_base10]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE FUNCTION [dbo].[S2T_convert_TO_base10] (@string VARCHAR(255), @base TINYINT)
RETURNS INT AS 
BEGIN
  -- Declarations
  DECLARE @return INT
  DECLARE @len INT
  DECLARE @finished BIT
  DECLARE @pos INT
  DECLARE @thischar CHAR(1)
  DECLARE @thisasc INT
  DECLARE @val INT

  -- Initialise
  SELECT @base     = CASE WHEN @base < 2 OR @base IS NULL THEN 2 WHEN @base > 36 THEN 36 ELSE @base END
  SELECT @return   = 0
  SELECT @finished = 0
  SELECT @string   = UPPER(@string)
  SELECT @len      = DATALENGTH(@string)

  -- Failsafe
  IF @len = 0
     SELECT @finished = 1

  -- Loop over all characters: capitalise first character and those after spaces, replace underscores with spaces
  SELECT @pos = 0

  WHILE @finished = 0
  BEGIN
    SELECT @pos = @pos + 1

    IF @pos > @len
       -- If we've run out of characters, we're done
       SELECT @finished = 1
    ELSE
    BEGIN
       -- Get the character (from right to left)
       SELECT @thischar = SUBSTRING(@string, (@len - (@pos - 1)), 1)

       -- Get the character's ASCII value
       SELECT @thisasc  = ASCII(@thischar)

       -- Convert to a numerical value
       SELECT @val = CASE
                       WHEN @thisasc BETWEEN 48 AND 57 -- '0' AND '9'
                         THEN @thisasc - 48
                       WHEN @thisasc BETWEEN 65 AND 90 -- 'A' (= decimal 10) AND 'Z'
                         THEN @thisasc - 65 + 10
                       ELSE 0 END

       -- Add this portion on
       SELECT @return = @return + (POWER(@base, (@pos - 1)) * @val)
    END
  END
  -- Done
  RETURN @return
END
GO
