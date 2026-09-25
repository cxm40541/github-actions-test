/****** Object:  View [dbo].[IncassiPerGrafici3]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[IncassiPerGrafici3]
AS
SELECT     Incassi.Data, Incassi.Incasso, Incassi.codicelocale, Incassi.prop AS Proprieta, Incassi.associato AS Associato, incassi.agente AS Agente, 
                      Incassi.tipooggetto, Incassi.codiceoggetto, schede.nome AS Modello, schede.matricola AS Matricola
FROM         incassi, schede
WHERE     incassi.codiceoggetto = schede.idscheda AND incassi.tipooggetto = 1
UNION
SELECT     Incassi.Data, Incassi.Incasso, Incassi.codicelocale, Incassi.prop AS Proprieta, Incassi.associato AS Associato, incassi.agente AS Agente, 
                      Incassi.tipooggetto, Incassi.codiceoggetto, dedicati.nome AS Modello, dedicati.matricola AS Matricola
FROM         incassi, dedicati
WHERE     incassi.codiceoggetto = dedicati.iddedicato AND incassi.tipooggetto = 2
UNION
SELECT     Incassi.Data, Incassi.Incasso, Incassi.codicelocale, Incassi.prop AS Proprieta, Incassi.associato AS Associato, incassi.agente AS Agente, 
                      Incassi.tipooggetto, Incassi.codiceoggetto, distribut.nome AS Modello, distribut.matricola AS Matricola
FROM         incassi, distribut
WHERE     incassi.codiceoggetto = distribut.iddistributore AND incassi.tipooggetto = 15
GO
