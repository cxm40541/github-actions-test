/****** Object:  View [dbo].[IntervalliIncassi]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[IntervalliIncassi] AS SELECT ROUND(incassonetto/numgiorni,2) AS Media, *  FROM (SELECT INCA1.IdIncasso, INCA1.codicelocale AS IdLocale, INCA1.TipoOggetto, INCA1.CodiceOggetto, (SELECT MAX(Data) FROM Incassi AS INCA3 WHERE INCA3.Data<INCA1.Data AND INCA3.codicelocale=INCA1.codicelocale) AS DataDa, INCA1.Data AS DataA,  ABS(DATEDIFF(d,INCA1.Data,(SELECT MAX(Data) FROM Incassi AS INCA4 WHERE INCA4.Data<INCA1.Data AND INCA4.codicelocale=INCA1.codicelocale))) AS NumGiorni, INCA1.Incasso, INCA1.IncassoNetto, INCA1.TotaleEntrate, INCA1.TotaleUscite, INCA1.Tasse, INCA1.Rete, INCA1.Aams, INCA1.ParTipologiaMonopoli, INCA1.prop AS IdSocieta, INCA1.agente, INCA1.associato, INCA1.ricevuta, INCA1.bollettaincasso, INCA1.trasferito  FROM Incassi AS INCA1  WHERE EXISTS (SELECT INCA2.IdIncasso FROM Incassi AS INCA2 WHERE INCA2.Data<INCA1.Data AND INCA2.codicelocale=INCA1.codicelocale) ) AS PINO
GO
