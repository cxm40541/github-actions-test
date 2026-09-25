/****** Object:  View [dbo].[ApparecchiConTipologia]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ApparecchiConTipologia] AS select schede.matricola as matricola,schede.nome,schede.idscheda as codiceoggetto,1 as tipooggetto,partipologiamonopoli from mobili,schede,move as mm,move as ms Where ms.Scheda = schede.idscheda And mm.Mobile = mobili.idmobile and ms.movimentorif=mm.idmove UNION select dedicati.matricola as matricola,dedicati.nome,iddedicato as codiceoggetto,2 as tipooggetto,partipologiamonopoli from dedicati,move where move.dedicato=dedicati.iddedicato
GO
