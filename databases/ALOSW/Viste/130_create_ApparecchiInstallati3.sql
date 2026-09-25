/****** Object:  View [dbo].[ApparecchiInstallati3]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ApparecchiInstallati3] AS SELECT     'NSL' AS Categoria, 'New Slot' AS Tipo, move.locale AS IdLocale, 2 AS TipoOggetto, 'NSL' AS TipoOggettoDesc, move.dedicato AS CodiceOggetto, 
dedicati.prop AS Proprieta, dedicati.agente AS Associato, dedicati.matricola, dedicati.nome AS Modello, dedicati.identificativo, dedicati.nullaosta, 
1 AS TM, move.idmove, NULL AS IdStorico, 0 AS IdPadre, move.DataCambio AS DataDa, NULL AS DataA, Dedicati.DataCreazione, dedicati.fornitore, 
dedicati.costruttore, dedicati.IdMagazzino, 0 AS Ordinamento, 0 AS OrdinamentoCategoria, Genere as TipoMobile, ParTipoScheda.TextTS AS TipoScheda 
FROM         (move INNER JOIN  dedicati ON dedicati.iddedicato = move.dedicato) 
LEFT JOIN ParTipoScheda ON ParTipoScheda.IdParTS = Dedicati.ParTipoScheda 
Where dedicati.ParTipologiaMonopoli = 1 And Move.Dedicato > 0 
Union 
SELECT     'C7A' AS Categoria, 'Gioco' AS Tipo, move.locale AS IdLocale, 2 AS TipoOggetto, 'GIO' AS TipoOggettoDesc, move.dedicato AS CodiceOggetto, 
dedicati.prop AS Proprieta, dedicati.agente AS Associato, dedicati.matricola, dedicati.nome AS Modello, dedicati.identificativo, dedicati.nullaosta, 
ParTipologiaMonopoli AS TM, move.idmove, NULL AS IdStorico, 0 AS IdPadre, move.DataCambio AS DataDa, NULL AS DataA, Dedicati.DataCreazione, 
dedicati.fornitore, dedicati.costruttore, dedicati.IdMagazzino, 1 AS Ordinamento, 1 AS OrdinamentoCategoria, Genere as TipoMobile, ParTipoScheda.TextTS AS TipoScheda 
FROM         (move INNER JOIN dedicati ON dedicati.iddedicato = move.dedicato) 
LEFT JOIN ParTipoScheda ON ParTipoScheda.IdParTS = Dedicati.ParTipoScheda 
Where dedicati.ParTipologiaMonopoli = 2 And Move.Dedicato > 0 
Union 
SELECT     'C7C' AS Categoria, 'Gioco' AS Tipo, move.locale AS IdLocale, 2 AS TipoOggetto, 'GIO' AS TipoOggettoDesc, move.dedicato AS CodiceOggetto, 
dedicati.prop AS Proprieta, dedicati.agente AS Associato, dedicati.matricola, dedicati.nome AS Modello, dedicati.identificativo, dedicati.nullaosta, 
ParTipologiaMonopoli AS TM, move.idmove, NULL AS IdStorico, 0 AS IdPadre, move.DataCambio AS DataDa, NULL AS DataA, Dedicati.DataCreazione, 
dedicati.fornitore, dedicati.costruttore, dedicati.IdMagazzino, 1 AS Ordinamento, 2 AS OrdinamentoCategoria, Genere as TipoMobile, ParTipoScheda.TextTS AS TipoScheda 
FROM         (move INNER JOIN dedicati ON dedicati.iddedicato = move.dedicato) 
LEFT JOIN ParTipoScheda ON ParTipoScheda.IdParTS = Dedicati.ParTipoScheda 
Where dedicati.ParTipologiaMonopoli = 4 And Move.Dedicato > 0 
Union 
SELECT     'MEC' AS Categoria, 'Gioco' AS Tipo, move.locale AS IdLocale, 2 AS TipoOggetto, 'GIO' AS TipoOggettoDesc, move.dedicato AS CodiceOggetto, 
dedicati.prop AS Proprieta, dedicati.agente AS Associato, dedicati.matricola, dedicati.nome AS Modello, dedicati.identificativo, dedicati.nullaosta, 
ParTipologiaMonopoli AS TM, move.idmove, NULL AS IdStorico, 0 AS IdPadre, move.DataCambio AS DataDa, NULL AS DataA, Dedicati.DataCreazione, 
dedicati.fornitore, dedicati.costruttore, dedicati.IdMagazzino, 1 AS Ordinamento, 3 AS OrdinamentoCategoria, Genere as TipoMobile, ParTipoScheda.TextTS AS TipoScheda 
FROM         (move INNER JOIN  dedicati ON dedicati.iddedicato = move.dedicato) 
LEFT JOIN ParTipoScheda ON ParTipoScheda.IdParTS = Dedicati.ParTipoScheda 
WHERE     (dedicati.partipologiamonopoli > 4 OR 
dedicati.partipologiamonopoli IS NULL) AND move.dedicato > 0 
Union 
SELECT     'NSL' AS Categoria, 'Mobile' AS Tipo, move.locale AS IdLocale, 0 AS TipoOggetto, 'MOB' AS TipoOggettoDesc, move.mobile AS CodiceOggetto, 
mobili.prop AS Proprieta, mobili.agente AS Associato, mobili.matricola, mobili.modello AS Modello, mobili.identificativo, mobili.nullaosta, 
ParTipologiaMonopoli AS TM, move.idmove, NULL AS IdStorico, 0 AS IdPadre, move.DataCambio AS DataDa, NULL AS DataA, mobili.DataCreazione, 
mobili.fornitore, mobili.costruttore, mobili.IdMagazzino, 2 AS Ordinamento, 0 AS OrdinamentoCategoria, '' as TipoMobile, '' AS TipoScheda 
From Move, mobili 
Where mobili.idmobile = Move.mobile And Move.mobile > 0 And ParTipologiaMonopoli = 1 
Union 
SELECT     'C7A' AS Categoria, 'Mobile' AS Tipo, move.locale AS IdLocale, 0 AS TipoOggetto, 'MOB' AS TipoOggettoDesc, move.mobile AS CodiceOggetto, 
mobili.prop AS Proprieta, mobili.agente AS Associato, mobili.matricola, mobili.modello AS Modello, mobili.identificativo, mobili.nullaosta, 
ParTipologiaMonopoli AS TM, move.idmove, NULL AS IdStorico, 0 AS IdPadre, move.DataCambio AS DataDa, NULL AS DataA, mobili.DataCreazione, 
mobili.fornitore, mobili.costruttore, mobili.IdMagazzino, 2 AS Ordinamento, 1 AS OrdinamentoCategoria, '' as TipoMobile, '' AS TipoScheda 
From Move, mobili 
Where mobili.idmobile = Move.mobile And Move.mobile > 0 And ParTipologiaMonopoli = 2 
Union 
SELECT     'C7C' AS Categoria, 'Mobile' AS Tipo, move.locale AS IdLocale, 0 AS TipoOggetto, 'MOB' AS TipoOggettoDesc, move.mobile AS CodiceOggetto, 
mobili.prop AS Proprieta, mobili.agente AS Associato, mobili.matricola, mobili.modello AS Modello, mobili.identificativo, mobili.nullaosta, 
ParTipologiaMonopoli AS TM, move.idmove, NULL AS IdStorico, 0 AS IdPadre, move.DataCambio AS DataDa, NULL AS DataA, mobili.DataCreazione, 
mobili.fornitore, mobili.costruttore, mobili.IdMagazzino, 2 AS Ordinamento, 2 AS OrdinamentoCategoria, '' as TipoMobile, '' AS TipoScheda 
From Move, mobili 
Where mobili.idmobile = Move.mobile And Move.mobile > 0 And ParTipologiaMonopoli = 4 
Union 
SELECT     'MEC' AS Categoria, 'Mobile' AS Tipo, move.locale AS IdLocale, 0 AS TipoOggetto, 'MOB' AS TipoOggettoDesc, move.mobile AS CodiceOggetto, 
mobili.prop AS Proprieta, mobili.agente AS Associato, mobili.matricola, mobili.modello AS Modello, mobili.identificativo, mobili.nullaosta, 
ParTipologiaMonopoli AS TM, move.idmove, NULL AS IdStorico, 0 AS IdPadre, move.DataCambio AS DataDa, NULL AS DataA, mobili.DataCreazione, 
mobili.fornitore, mobili.costruttore, mobili.IdMagazzino, 2 AS Ordinamento, 3 AS OrdinamentoCategoria, '' as TipoMobile, '' AS TipoScheda 
From Move, mobili 
WHERE     mobili.idmobile = move.mobile AND move.mobile > 0 AND (mobili.partipologiamonopoli > 4 OR 
mobili.partipologiamonopoli IS NULL) 
Union 
SELECT     'SCH' AS Categoria, 'Scheda' AS Tipo, FirstMove.locale AS IdLocale, 1 AS TipoOggetto, 'SCH' AS TipoOggettoDesc, FirstMove.scheda AS CodiceOggetto, 
schede.prop AS Proprieta, schede.agente AS Associato, schede.matricola, schede.nome AS Modello, '' AS identificativo, '' AS nullaosta, NULL AS TM, 
FirstMove.idmove, NULL AS IdStorico, 
(SELECT     SecondMove.mobile 
FROM          move AS SecondMove 
WHERE      SecondMove.idmove = FirstMove.movimentorif) AS IdPadre, FirstMove.DataCambio AS DataDa, NULL AS DataA, schede.DataCreazione, 
schede.fornitore, schede.costruttore, schede.IdMagazzino, 3 AS Ordinamento, 4 AS OrdinamentoCategoria, '' as TipoMobile, '' AS TipoScheda 
FROM         move AS FirstMove, schede 
Where schede.idscheda = FirstMove.Scheda And FirstMove.Scheda > 0 
Union 
SELECT     'DIS' AS Categoria, 'Distributore' AS Tipo, move.locale AS IdLocale, 15 AS TipoOggetto, 'DIS' AS TipoOggettoDesc, move.distributore AS CodiceOggetto,
distribut.prop AS Proprieta, distribut.agente AS Associato, distribut.matricola, distribut.nome AS Modello, '' AS identificativo, '' AS nullaosta, NULL 
AS TM, move.idmove, NULL AS IdStorico, 0 AS IdPadre, move.DataCambio AS DataDa, NULL AS DataA, distribut.DataCreazione, distribut.fornitore, 
distribut.costruttore, distribut.IdMagazzino, 4 AS Ordinamento, 5 AS OrdinamentoCategoria, '' as TipoMobile, '' AS TipoScheda 
From Move, distribut 
Where distribut.iddistributore = Move.distributore And Move.distributore > 0 
Union 
SELECT     'ACC' AS Categoria, 'Accessorio' AS Tipo, move.locale AS IdLocale, 3 AS TipoOggetto, 'ACC' AS TipoOggettoDesc, move.Accessorio AS CodiceOggetto, 
Accessori.prop AS Proprieta, '' AS Associato, Accessori.matricola, Accessori.nome AS Modello, '' AS identificativo, '' AS nullaosta, NULL AS TM, 
move.idmove, NULL AS IdStorico, 0 AS IdPadre, move.DataCambio AS DataDa, NULL AS DataA, Accessori.DataCostruzione AS DataCreazione, 
Accessori.fornitore, Accessori.costruttore, Accessori.IdMagazzino, 5 AS Ordinamento, 6 AS OrdinamentoCategoria, '' as TipoMobile, '' AS TipoScheda 
From Move, Accessori 
Where Accessori.idAccessorio = Move.ACCESSORIO And Move.ACCESSORIO > 0
GO
