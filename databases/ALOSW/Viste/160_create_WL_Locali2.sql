/****** Object:  View [dbo].[WL_Locali2]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WL_Locali2]
AS
SELECT     dbo.locali.*, dbo.ParGenereLocale.Descrizione AS Descrizione, dbo.Societa.RagioneSociale AS RagioneSociale
FROM         dbo.locali LEFT OUTER JOIN
                      dbo.ParGenereLocale ON dbo.locali.Genere = dbo.ParGenereLocale.IdPar LEFT OUTER JOIN
                      dbo.Societa ON dbo.Societa.IdSocieta = dbo.locali.Prop
WHERE     (dbo.locali.DataFine IS NULL)
GO
