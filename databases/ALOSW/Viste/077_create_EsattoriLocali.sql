/****** Object:  View [dbo].[EsattoriLocali]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[EsattoriLocali]
AS
SELECT     dbo.locali.IdLocale, MIN(dbo.Esattore.NomeEsattore) AS Esattore
FROM         dbo.LocGiri INNER JOIN
                      dbo.locali ON dbo.LocGiri.Locale = dbo.locali.IdLocale INNER JOIN
                      dbo.Giri ON dbo.LocGiri.Giro = dbo.Giri.IdGiro INNER JOIN
                      dbo.Esattore ON dbo.Giri.Esattore = dbo.Esattore.IdEsattore
GROUP BY dbo.locali.IdLocale
GO
