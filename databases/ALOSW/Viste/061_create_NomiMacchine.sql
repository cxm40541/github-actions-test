/****** Object:  View [dbo].[NomiMacchine]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[NomiMacchine]
AS
SELECT     1 AS TipoOggetto, idscheda AS CodiceOggetto, Nome AS NomeOggetto, Matricola AS MatricolaOggetto
FROM         schede
UNION
SELECT     2 AS TipoOggetto, iddedicato AS CodiceOggetto, Nome AS NomeOggetto, Matricola AS MatricolaOggetto
FROM         dedicati
UNION
SELECT     15 AS TipoOggetto, iddistributore AS CodiceOggetto, Nome AS NomeOggetto, Matricola AS MatricolaOggetto
FROM         distribut
GO
