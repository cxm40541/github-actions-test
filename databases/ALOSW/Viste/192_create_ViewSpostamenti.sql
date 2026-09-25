/****** Object:  View [dbo].[ViewSpostamenti]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewSpostamenti]
AS
SELECT     Spostamenti.IdSpostamento, dedicati.Nome AS AppoNome, 'Dedicato' AS AppoTipo, societa.ragionesociale
FROM         dedicati, spostamenti, societa
WHERE     spostamenti.iddedicato = dedicati.iddedicato AND societa.idsocieta = spostamenti.idsocieta
UNION
SELECT     Spostamenti.IdSpostamento, Mobili.Modello AS AppoNome, 'Mobile' AS AppoTipo, societa.ragionesociale
FROM         Mobili, spostamenti, societa
WHERE     spostamenti.IdMobile = Mobili.IdMobile AND societa.idsocieta = spostamenti.idsocieta
GO
