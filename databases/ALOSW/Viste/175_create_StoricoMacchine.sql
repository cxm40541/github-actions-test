/****** Object:  View [dbo].[StoricoMacchine]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StoricoMacchine]
AS
SELECT     1 AS TipoOggetto, idscheda AS CodiceOggetto, prop AS Proprieta, agente AS Associato, DataFine
FROM         schede
UNION
SELECT     2 AS TipoOggetto, iddedicato AS CodiceOggetto, prop AS Proprieta, agente AS Associato, DataFine
FROM         dedicati
UNION
SELECT     15 AS TipoOggetto, iddistributore AS CodiceOggetto, prop AS Proprieta, agente AS Associato, DataFine
FROM         distribut
GO
