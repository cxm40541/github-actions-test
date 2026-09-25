/****** Object:  View [dbo].[IncassiPerGrafici7]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[IncassiPerGrafici7] AS 
SELECT     dbo.Incassi.Data, dbo.Incassi.Incasso, dbo.Incassi.TotaleEntrate, dbo.Incassi.CodiceLocale, dbo.Incassi.prop AS Proprieta, 
                      dbo.Incassi.associato AS Associato, dbo.Incassi.agente AS Agente, dbo.Incassi.TipoOggetto, dbo.Incassi.CodiceOggetto, dbo.Schede.Nome AS Modello,
                       dbo.Schede.Matricola, 'Prontoscheda' AS TIPO, 0 AS TipoMonopoli, dbo.Incassi.IncassoNetto AS Netto
FROM         dbo.Incassi INNER JOIN
                      dbo.Schede ON dbo.Incassi.CodiceOggetto = dbo.Schede.IdScheda
WHERE     (dbo.Incassi.TipoOggetto = 1)
UNION
SELECT     dbo.Incassi.Data, dbo.Incassi.Incasso, dbo.Incassi.TotaleEntrate, dbo.Incassi.CodiceLocale, dbo.Incassi.prop AS Proprieta, 
                      dbo.Incassi.associato AS Associato, dbo.Incassi.agente AS Agente, dbo.Incassi.TipoOggetto, dbo.Incassi.CodiceOggetto, 
                      dbo.Dedicati.Nome AS Modello, dbo.Dedicati.Matricola, 'New Slot' AS TIPO, dbo.Dedicati.ParTipologiaMonopoli AS TipoMonopoli, 
                      dbo.Incassi.IncassoNetto AS Netto
FROM         dbo.Incassi INNER JOIN
                      dbo.Dedicati ON dbo.Incassi.CodiceOggetto = dbo.Dedicati.IdDedicato
WHERE     (dbo.Incassi.TipoOggetto = 2) AND (dbo.Dedicati.ParTipologiaMonopoli = 1)
UNION
SELECT     dbo.Incassi.Data, dbo.Incassi.Incasso, dbo.Incassi.TotaleEntrate, dbo.Incassi.CodiceLocale, dbo.Incassi.prop AS Proprieta, 
                      dbo.Incassi.associato AS Associato, dbo.Incassi.agente AS Agente, dbo.Incassi.TipoOggetto, dbo.Incassi.CodiceOggetto, 
                      dbo.Dedicati.Nome AS Modello, dbo.Dedicati.Matricola, 'Gioco' AS TIPO, dbo.Dedicati.ParTipologiaMonopoli AS TipoMonopoli, 
                      dbo.Incassi.IncassoNetto AS Netto
FROM         dbo.Incassi INNER JOIN
                      dbo.Dedicati ON dbo.Incassi.CodiceOggetto = dbo.Dedicati.IdDedicato
WHERE     (dbo.Incassi.TipoOggetto = 2) AND (dbo.Dedicati.ParTipologiaMonopoli <> 1 OR
                      dbo.Dedicati.ParTipologiaMonopoli IS NULL)
UNION
SELECT     dbo.Incassi.Data, dbo.Incassi.Incasso, dbo.Incassi.TotaleEntrate, dbo.Incassi.CodiceLocale, dbo.Incassi.prop AS Proprieta, 
                      dbo.Incassi.associato AS Associato, dbo.Incassi.agente AS Agente, dbo.Incassi.TipoOggetto, dbo.Incassi.CodiceOggetto, 
                      dbo.Distribut.Nome AS Modello, dbo.Distribut.Matricola, 'Distributore' AS TIPO, 0 AS TipoMonopoli, dbo.Incassi.IncassoNetto AS Netto
FROM         dbo.Incassi INNER JOIN
                      dbo.Distribut ON dbo.Incassi.CodiceOggetto = dbo.Distribut.IdDistributore
WHERE     (dbo.Incassi.TipoOggetto = 15)
GO
