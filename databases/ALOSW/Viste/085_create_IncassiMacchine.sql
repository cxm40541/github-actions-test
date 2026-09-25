/****** Object:  View [dbo].[IncassiMacchine]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[IncassiMacchine]
AS
SELECT     incassi.codicelocale AS CodiceLocale, 1 AS TipoOggetto, incassi.codiceoggetto AS CodiceOggetto, schede.prop AS Proprieta
FROM         incassi, schede
WHERE     schede.idscheda = incassi.codiceoggetto AND incassi.tipooggetto = 1 AND incassi.ricevuta = 0
UNION
SELECT     incassi.codicelocale AS CodiceLocale, 2 AS TipoOggetto, incassi.codiceoggetto AS CodiceOggetto, dedicati.prop AS Proprieta
FROM         incassi, dedicati
WHERE     dedicati.iddedicato = incassi.codiceoggetto AND incassi.tipooggetto = 2 AND incassi.ricevuta = 0
UNION
SELECT     incassi.codicelocale AS CodiceLocale, 15 AS TipoOggetto, incassi.codiceoggetto AS CodiceOggetto, distribut.prop AS Proprieta
FROM         incassi, distribut
WHERE     distribut.iddistributore = incassi.codiceoggetto AND incassi.tipooggetto = 15 AND incassi.ricevuta = 0
UNION
SELECT     incassi.codicelocale AS CodiceLocale, incassi.tipooggetto AS TipoOggetto, incassi.codiceoggetto AS CodiceOggetto, prop AS Proprieta
FROM         incassi
WHERE     incassi.ricevuta = 0 AND incassi.TipoIncasso = 10
GO
