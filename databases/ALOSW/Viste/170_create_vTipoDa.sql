/****** Object:  View [dbo].[vTipoDa]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vTipoDa]
AS
SELECT     '0' AS TIPO, IdMagazzino AS AppoId, NomeMagazzino AS Nome, Indirizzo + '  ' + Cap + ' ' + Comune + ' ' + Provincia AS AddInfo
FROM         Magazzini
UNION
SELECT     '1' AS TIPO, IdLocale AS AppoId, Nome AS Nome, Indirizzo AS AddInfo
FROM         Locali
UNION
SELECT     '2' AS TIPO, IdCostruttore AS AppoId, Nome AS Nome, Indirizzo + '  ' + CAP + ' ' + Comune + ' ' + Provincia AS AddInfo
FROM         COstr
UNION
SELECT     '3' AS TIPO, IdFornitore AS AppoId, Nome AS Nome, Indirizzo + '  ' + CAP + ' ' + Comune + ' ' + Provincia AS AddInfo
FROM         Forn
GO
