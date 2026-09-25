/****** Object:  View [dbo].[Apparecchi]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Apparecchi]
AS
SELECT     ApparecchiInstallati.*, locali.nome AS Luogo
FROM         ApparecchiInstallati, locali
WHERE     ApparecchiInstallati.idlocale = locali.idlocale
UNION
SELECT     ApparecchiInMagazzino.*, magazzini.nomemagazzino AS Luogo
FROM         ApparecchiInMagazzino, magazzini
WHERE     ApparecchiInMagazzino.idmagazzino = magazzini.idmagazzino
GO
