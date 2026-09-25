/****** Object:  View [dbo].[ProprietaMacchine]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ProprietaMacchine]
AS
SELECT     move.locale AS CodiceLocale, 1 AS TipoOggetto, move.scheda AS CodiceOggetto, schede.prop AS Proprieta
FROM         move, schede
WHERE     schede.idscheda = move.scheda AND move.scheda > 0
UNION
SELECT     move.locale AS CodiceLocale, 2 AS TipoOggetto, move.dedicato AS CodiceOggetto, dedicati.prop AS Proprieta
FROM         move, dedicati
WHERE     dedicati.iddedicato = move.dedicato AND move.dedicato > 0
UNION
SELECT     move.locale AS CodiceLocale, 15 AS TipoOggetto, move.distributore AS CodiceOggetto, distribut.prop AS Proprieta
FROM         move, distribut
WHERE     distribut.iddistributore = move.distributore AND move.distributore > 0
GO
