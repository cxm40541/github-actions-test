/****** Object:  View [dbo].[EsattoreGiornoLocale]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[EsattoreGiornoLocale]
AS
SELECT     dbo.Esattore.NomeEsattore, dbo.Giri.Giorno, dbo.LocGiri.Locale AS Idlocale, dbo.locali.Nome AS NomeLocale
FROM         dbo.Esattore LEFT OUTER JOIN
                      dbo.Giri ON dbo.Esattore.IdEsattore = dbo.Giri.Esattore LEFT OUTER JOIN
                      dbo.LocGiri ON dbo.LocGiri.Giro = dbo.Giri.IdGiro LEFT OUTER JOIN
                      dbo.locali ON dbo.LocGiri.Locale = dbo.locali.IdLocale
GO
