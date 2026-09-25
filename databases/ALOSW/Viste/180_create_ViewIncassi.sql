/****** Object:  View [dbo].[ViewIncassi]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewIncassi]
AS
SELECT     Incassi.IdIncasso, Incassi.Data, Locali.Nome, Incassi.Incasso, Incassi.IncassoNetto, Incassi.TotaleEntrate, Incassi.TotaleUscite, Incassi.Tasse, 
                      Incassi.Bollettaincasso, Incassi.codicelocale, Incassi.prop AS Proprieta, Incassi.associato AS Associato, incassi.agente AS Agente, Incassi.tipooggetto,
                       Incassi.codiceoggetto, 'Scheda' AS TipoMacchina, schede.nome AS Modello, schede.matricola AS Matricola, Incassi.PartipologiaMonopoli
FROM         incassi, schede, locali
WHERE     locali.idlocale = incassi.codicelocale AND incassi.codiceoggetto = schede.idscheda AND incassi.tipooggetto = 1
UNION
SELECT     Incassi.IdIncasso, Incassi.Data, Locali.Nome, Incassi.Incasso, Incassi.IncassoNetto, Incassi.TotaleEntrate, Incassi.TotaleUscite, Incassi.Tasse, 
                      Incassi.Bollettaincasso, Incassi.codicelocale, Incassi.prop AS Proprieta, Incassi.associato AS Associato, incassi.agente AS Agente, Incassi.tipooggetto,
                       Incassi.codiceoggetto, 'Dedicato' AS TipoMacchina, dedicati.nome AS Modello, dedicati.matricola AS Matricola, Incassi.PartipologiaMonopoli
FROM         incassi, dedicati, locali
WHERE     locali.idlocale = incassi.codicelocale AND incassi.codiceoggetto = dedicati.iddedicato AND incassi.tipooggetto = 2
UNION
SELECT     Incassi.IdIncasso, Incassi.Data, Locali.Nome, Incassi.Incasso, Incassi.IncassoNetto, Incassi.TotaleEntrate, Incassi.TotaleUscite, Incassi.Tasse, 
                      Incassi.Bollettaincasso, Incassi.codicelocale, Incassi.prop AS Proprieta, Incassi.associato AS Associato, incassi.agente AS Agente, Incassi.tipooggetto,
                       Incassi.codiceoggetto, 'Distributore' AS TipoMacchina, distribut.nome AS Modello, distribut.matricola, Incassi.PartipologiaMonopoli AS Matricola
FROM         incassi, distribut, locali
WHERE     locali.idlocale = incassi.codicelocale AND incassi.codiceoggetto = distribut.iddistributore AND incassi.tipooggetto = 15
GO
