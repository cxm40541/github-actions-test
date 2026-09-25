/****** Object:  View [dbo].[RiepilogoBonus]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[RiepilogoBonus] AS SELECT distinct appoincassi.IdIncasso, incassi.data, incassi.codicelocale,incassi.bollettaincasso, locali.nome as NomeLocale, Esattore.idesattore,Esattore.NomeEsattore,appoincassi.bonus,TipoOggetto,codiceoggetto,
 CASE WHEN tipooggetto = 15 THEN distribut.matricola ELSE dedicati.identificativo END as CODEID, 
 CASE WHEN tipooggetto = 15 THEN distribut.nome ELSE dedicati.nome END as modello 
 FROM ((((((AppoIncassi LEFT JOIN incassi ON appoincassi.idincasso = incassi.idincasso)
 LEFT JOIN Dedicati ON incassi.codiceoggetto = dedicati.iddedicato)
 LEFT JOIN distribut ON incassi.codiceoggetto = distribut.iddistributore)
 LEFT JOIN locali ON incassi.codicelocale = locali.idlocale)
 LEFT JOIN locgiri ON locgiri.locale=locali.idlocale)
 LEFT JOIN giri ON locgiri.giro=giri.idgiro)
 LEFT JOIN Esattore ON Esattore.IdEsattore=giri.esattore
 Where appoincassi.Bonus <> 0
GO
