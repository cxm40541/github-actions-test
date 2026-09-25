/****** Object:  View [dbo].[vMAG_Inventario]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vMAG_Inventario] AS SELECT  r.codice, r.codicefornitore, r.matricola, tr.Descrizione AS Tipo, mtr.FullNome, mtr.Nome AS MtrNome, r.IdCategoria, r.NomeRicambio, forn.Nome AS Fornitore, costr.Nome AS Costruttore, r.Descrizione AS RicDes, r.serie, m.Etichetta AS Ubicazione, vmag.Nome AS UbiNome, vmag.InfoAdd AS UbiInfo, rg.TipoLuogo, R.IdParTipologia , vmag.UbiFinNome, vmag.UbiFinCod, R.IdRicambio, rg.fkLuogo, R.TipoOggetto FROM  Ricambi AS r INNER JOIN RicambiGiacenza AS rg ON r.IdRicambio = rg.fkRicambio INNER JOIN MAG_TipoLuogo AS m ON rg.TipoLuogo = m.DesTipoLuogo LEFT OUTER JOIN ParTipologiaRicambi AS tr ON tr.IdPar = r.IdParTipologia LEFT OUTER JOIN costr ON costr.IdCostruttore = r.IdCostruttore LEFT OUTER JOIN forn ON forn.IdFornitore = r.IdFornitore LEFT OUTER JOIN MacroTipoRicambi AS mtr ON mtr.IdMacroTipoRicambio = r.IdCategoria LEFT OUTER JOIN vMAG_RicambiUbicazione AS vmag ON vmag.fkRicambio = r.IdRicambio
GO
