/****** Object:  View [dbo].[ApparecchiIncassiNSL]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ApparecchiIncassiNSL] AS SELECT 'NSL' AS Categoria, 'New Slot' AS Tipo, incassi.codicelocale AS IdLocale,2 AS TipoOggetto, 'NSL' AS TipoOggettoDesc, incassi.CodiceOggetto,incassi.prop AS Proprieta,incassi.agente, incassi.Associato, dedicati.matricola,dedicati.nome as Modello, dedicati.identificativo, dedicati.nullaosta, 1 AS TM ,NULL AS idmove, incassi.idincasso,incassi.data, tipoincasso,  incassi.incasso,incassonetto, ricevuta, contatore1, contatore2, contatore3, contatore4, bollettaincasso,  trasferito, totaleentrate, totaleuscite, perc, tasse, aams, rete, idmagazzino, 0 AS Ordinamento,  0 AS OrdinamentoCategoria,idconcessionario,societa.ragionesociale,tipomerce AS TipoScarto,locali.Nome  as Locale FROM incassi,dedicati,societa,locali WHERE locali.idlocale=incassi.codicelocale AND  societa.idsocieta=incassi.prop AND dedicati.iddedicato=incassi.codiceoggetto AND incassi.partipologiamonopoli=1  AND incassi.tipooggetto=2
GO
