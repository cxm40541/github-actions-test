/****** Object:  View [dbo].[vTipoDa3]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vTipoDa3] AS  SELECT 0 AS TIPO, IdMagazzino AS AppoId, NomeMagazzino AS AliasNome, Indirizzo + '  ' + Cap + ' ' + Comune + ' ' + Provincia AS AddInfo, ' ' as PIVA From Magazzini  Union SELECT 1 AS TIPO, IdLocale AS AppoId, Nome AS AliasNome, Indirizzo AS AddInfo, PIVA From Locali  Union SELECT 2 AS TIPO, IdCostruttore AS AppoId, Nome AS AliasNome, Indirizzo + '  ' + CAP + ' ' + Comune + ' ' + Provincia AS AddInfo, PIVA From COstr  UNION SELECT 3 AS TIPO, IdFornitore AS AppoId, Nome AS AliasNome, Indirizzo + '  ' + CAP + ' ' + Comune + ' ' + Provincia AS AddInfo, PIVA From Forn
GO
