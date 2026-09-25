/****** Object:  View [dbo].[CensimentoSchede]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CensimentoSchede]
AS
SELECT     idscheda, prop, 'b' AS Tipologia, movimentorif
FROM         schede, move
WHERE     move.scheda = schede.idscheda AND genere = 1
UNION
SELECT     idscheda, prop, 'c' AS Tipologia, movimentorif
FROM         schede, move
WHERE     move.scheda = schede.idscheda AND (genere <> 1 OR
                      genere IS NULL)
GO
