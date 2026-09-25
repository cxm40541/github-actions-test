/****** Object:  View [dbo].[InventarioLocaliPDA]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[InventarioLocaliPDA] AS  SELECT 'New Slot' AS Tipo, move.locale AS IdLocale,2 AS TipoOggetto,'NSL' AS TipoOggettoDesc,move.dedicato AS CodiceOggetto,dedicati.prop AS Proprieta,dedicati.agente AS Associato,
 dedicati.matricola,dedicati.nome as Modello, dedicati.identificativo,dedicati.nullaosta, move.idmove, 0 as IdPadre, 0 AS Ordinamento, idconcessionario as IdConc
 FROM move,dedicati WHERE dedicati.iddedicato=move.dedicato AND dedicati.partipologiamonopoli=1 AND move.dedicato>0
 Union SELECT 'Gioco' AS Tipo, move.locale AS IdLocale,2 AS TipoOggetto,'GIO' AS TipoOggettoDesc,move.dedicato AS CodiceOggetto,dedicati.prop AS Proprieta,dedicati.agente AS Associato,
 dedicati.matricola,dedicati.nome as Modello, dedicati.identificativo,dedicati.nullaosta, move.idmove,0 as IdPadre, 1 AS Ordinamento, '' as IdConc
 FROM move,dedicati WHERE dedicati.iddedicato=move.dedicato AND (dedicati.partipologiamonopoli<>1 OR dedicati.partipologiamonopoli IS NULL) AND move.dedicato>0
 Union SELECT 'Mobile' AS Tipo, move.locale AS IdLocale,0 AS TipoOggetto,'MOB' AS TipoOggettoDesc,move.mobile AS CodiceOggetto,mobili.prop AS Proprieta,mobili.agente AS Associato,
 mobili.matricola,mobili.modello as Modello, mobili.identificativo,mobili.nullaosta, move.idmove,0 as IdPadre, 2 AS Ordinamento, '' as IdConc
 FROM move,mobili WHERE mobili.idmobile=move.mobile AND move.mobile>0
 Union SELECT 'Scheda' AS Tipo, FirstMove.locale AS IdLocale,1 AS TipoOggetto,'SCH' AS TipoOggettoDesc, FirstMove.scheda AS CodiceOggetto,schede.prop AS Proprieta,schede.agente AS Associato,
 schede.matricola,schede.nome as Modello, '' AS identificativo,'' AS nullaosta, FirstMove.idmove,(SELECT SecondMove.mobile FROM move AS SecondMove WHERE SecondMove.idmove=FirstMove.movimentorif) as IdPadre, 3 AS Ordinamento, '' as IdConc
 FROM move AS FirstMove,schede WHERE schede.idscheda=FirstMove.scheda AND FirstMove.scheda>0
 Union SELECT 'Distributore' AS Tipo, move.locale AS IdLocale,15 AS TipoOggetto,'DIS' AS TipoOggettoDesc, move.distributore AS CodiceOggetto,distribut.prop AS Proprieta,distribut.agente AS Associato,
 distribut.matricola,distribut.nome as Modello, '' AS identificativo,'' AS nullaosta, move.idmove,0 as IdPadre, 4 AS Ordinamento, '' as IdConc
 FROM move,distribut WHERE distribut.iddistributore=move.distributore AND move.distributore>0
 Union SELECT 'Accessorio' AS Tipo, move.locale AS IdLocale,3 AS TipoOggetto,'ACC' AS TipoOggettoDesc, move.Accessorio AS CodiceOggetto,Accessori.prop AS Proprieta,'' AS Associato,
 Accessori.matricola,Accessori.nome as Modello, '' AS identificativo,'' AS nullaosta, move.idmove ,0 as IdPadre, 5 AS Ordinamento, '' as IdConc
 FROM move,Accessori WHERE Accessori.IdAccessorio=move.Accessorio AND move.Accessorio>0
 Union SELECT 'PDA' AS Tipo, movepda.locale AS IdLocale,77 AS TipoOggetto,'PDA' AS TipoOggettoDesc, movePDA.PDA AS CodiceOggetto,PDA.prop AS Proprieta,'' AS Associato,
 PDA.matricola,PDA.nome as Modello, macADDRESS AS identificativo,'' AS nullaosta, movePDA.idmove ,0 as IdPadre, 6 AS Ordinamento, IdRete as IdConc
 FROM movePDA,PDA WHERE PDA.IdPDA=movePDA.PDA AND movePDA.PDA>0
GO
