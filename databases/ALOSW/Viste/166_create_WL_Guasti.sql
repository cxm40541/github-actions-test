/****** Object:  View [dbo].[WL_Guasti]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WL_Guasti] AS SELECT Guasti.*, 'Locale' as TipoLuogo, 
Locali.Nome AS NomeLuogo, 
ParTipoGuasto.Descrizione, 
locali.Indirizzo as LuogoIndirizzo,locali.ind_cap as LuogoCap, 
locali.ind_comune as LuogoComune,locali.telefono AS LuogoTelefono 
FROM ((Guasti INNER JOIN Locali ON Locali.IdLocale = Guasti.IdLocale) 
LEFT JOIN ParTipoGuasto ON ParTipoGuasto.IdPar = Guasti.ParTipoGuasto) 
Where Guasti.IdLocale <> 0 
UNION 
SELECT Guasti.*, 'Magazzino' as TipoLuogo, 
Magazzini.NomeMagazzino AS NomeLuogo, 
ParTipoGuasto.Descrizione, 
Magazzini.Indirizzo as LuogoIndirizzo, 
Magazzini.cap as LuogoCap,Magazzini.comune as LuogoComune, 
Magazzini.telefono AS LuogoTelefono 
FROM ((Guasti INNER JOIN Magazzini ON Magazzini.IdMagazzino = Guasti.IdMagazzino) 
LEFT JOIN ParTipoGuasto ON ParTipoGuasto.IdPar = Guasti.ParTipoGuasto) 
Where Guasti.IdMagazzino <> 0
GO
