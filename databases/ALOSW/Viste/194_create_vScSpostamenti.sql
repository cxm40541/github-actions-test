/****** Object:  View [dbo].[vScSpostamenti]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vScSpostamenti]
AS
SELECT     Spostamenti.*, dedicati.Nome AS AppoNome, 'Dedicato' AS AppoTipo
FROM         dedicati, spostamenti
WHERE     spostamenti.iddedicato = dedicati.iddedicato AND Month(Data) = '11' AND YEAR(Data) = '2003'
UNION
SELECT     Spostamenti.*, Distribut.Nome AS AppoNome, 'Distributore' AS AppoTipo
FROM         Distribut, spostamenti
WHERE     spostamenti.IdDistributore = Distribut.IdDistributore AND Month(Data) = '11' AND YEAR(Data) = '2003'
UNION
SELECT     Spostamenti.*, Mobili.Modello AS AppoNome, 'Mobile' AS AppoTipo
FROM         Mobili, spostamenti
WHERE     spostamenti.IdMobile = Mobili.IdMobile AND Month(Data) = '11' AND YEAR(Data) = '2003'
GO
