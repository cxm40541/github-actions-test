/****** Object:  View [dbo].[vMAG_RicambiUbicazione]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vMAG_RicambiUbicazione] AS SELECT     rg.fkRicambio, Nome, Descrizione AS InfoAdd,
'' AS UbiFinNome, '' AS UbiFinCod
FROM         RicambiGiacenza rg INNER JOIN
                      RicambiLuoghi DT ON rg.fkLuogo = dt.IdLuogo
WHERE     rg.TipoLuogo = 'SP'
UNION
SELECT     rg.fkRicambio, DT.Nome, Identificativo AS InfoAdd, 
Locali.Nome AS UbiFinNome, Locali.Codice AS UbiFinCod
FROM        (( RicambiGiacenza rg INNER JOIN 
                      Dedicati DT ON rg.fkLuogo = dt.IdDedicato)
                      LEFT JOIN Move ON Move.Dedicato = dt.IdDedicato)
                      LEFT JOIN Locali ON Move.Locale = Locali.IdLocale
WHERE     rg.TipoLuogo IN ('A3', 'A4', 'A5')
UNION
SELECT     rg.fkRicambio, NomeMagazzino AS Nome, Comune AS InfoAdd,
'' AS UbiFinNome, '' AS UbiFinCod
FROM         RicambiGiacenza rg INNER JOIN
                      Magazzini DT ON rg.fkLuogo = dt.IdMagazzino
WHERE     rg.TipoLuogo = 'MA'
UNION
SELECT     rg.fkRicambio, Nome, Ind_Comune AS InfoAdd,
'' AS UbiFinNome, '' AS UbiFinCod
FROM         RicambiGiacenza rg INNER JOIN
                      Locali DT ON rg.fkLuogo = dt.IdLocale
WHERE     rg.TipoLuogo = 'LO'
UNION
SELECT     rg.fkRicambio, dt.Nome AS Nome, Matricola AS InfoAdd,
Locali.Nome AS UbiFinNome, Locali.Codice AS UbiFinCod
FROM        (( RicambiGiacenza rg INNER JOIN
                      Distribut DT ON rg.fkLuogo = dt.IdDistributore)
                      LEFT JOIN Move ON Move.Dedicato = dt.IdDistributore)
                      LEFT JOIN Locali ON Move.Locale = Locali.IdLocale
WHERE     rg.TipoLuogo = 'A6'
UNION
SELECT     rg.fkRicambio, dt.Modello AS Nome, Matricola AS InfoAdd,
Locali.Nome AS UbiFinNome, Locali.Codice AS UbiFinCod
FROM        (( RicambiGiacenza rg INNER JOIN
                      Mobili DT ON rg.fkLuogo = dt.IdMobile)
                      LEFT JOIN Move ON Move.Dedicato = dt.IdMobile) 
                      LEFT JOIN Locali ON Move.Locale = Locali.IdLocale
WHERE     rg.TipoLuogo = 'A7'
UNION
SELECT     rg.fkRicambio, dt.Nome AS Nome, Matricola AS InfoAdd,
Locali.Nome AS UbiFinNome, Locali.Codice AS UbiFinCod
FROM        (( RicambiGiacenza rg INNER JOIN
                      Accessori DT ON rg.fkLuogo = dt.IdAccessorio)
                      LEFT JOIN Move ON Move.Dedicato = dt.IdAccessorio)
                      LEFT JOIN Locali ON Move.Locale = Locali.IdLocale
                      
WHERE     rg.TipoLuogo = 'A8'
GO
