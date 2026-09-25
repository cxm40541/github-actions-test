/****** Object:  View [dbo].[DayActions]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DayActions] AS  SELECT  d.dateitem, l.IdLocale ,l.IdZona, l.Agente as IdAgente,l.Prop as IdSocieta, l.Nome,l.Indirizzo, l.Ind_cap as Cap,l.ind_comune as Localita, l.Codice AS Vese,
 isnull((SELECT ROUND(SUM(Importo), 2) AS Sospesi FROM SospesiRientri AS s
 WHERE (codicelocale = l.IdLocale) AND Importo>0 AND  (swIncasso = 0) AND (swStabilita = 0) and s.data=d.dateitem ), 0) AS [Sospesi],
 
 isnull((SELECT ROUND(SUM(Importo), 2) AS Sospesi FROM SospesiRientri AS s
 WHERE (codicelocale = l.IdLocale) AND  Importo<0 and (swIncasso = 0) AND (swStabilita = 0) and s.data=d.dateitem ), 0) AS [Rientri],
 
 isnull((SELECT ROUND(SUM(Importo), 2) AS Sospesi FROM  SospesiRientri AS s
 WHERE  (codicelocale = l.IdLocale) AND (swIncasso <> 0) AND (swStabilita = 0) and s.data=d.dateitem ), 0) AS [Bonifici],
 
 isnull((SELECT ROUND(SUM(Importo), 2) AS Expr1 FROM Acconti AS a
 WHERE (codicelocale = l.IdLocale) AND importo>0 and a.data=d.dateitem), 0) AS [Acconti Prelevati],
 
 isnull((SELECT     ROUND(SUM(Importo), 2) AS Expr1 FROM Acconti AS a
 WHERE      (codicelocale = l.IdLocale) and importo<0 and a.data=d.dateitem ), 0) AS [Acconti Utilizzati],
 
 isnull((SELECT     ROUND(SUM(Importo), 2) AS Expr1 FROM Acconti AS a
 WHERE      (codicelocale = l.IdLocale) and a.data=d.dateitem),0) AS [Acconti Saldo],
 
 isnull((SELECT     ROUND(SUM(Importo), 2) AS Expr1 FROM Furti AS f
 WHERE      (IdLocale = l.IdLocale) and f.data=d.dateitem),0) AS Furti,
 
 isnull((SELECT ROUND(SUM(Importo), 2) AS Expr1 FROM Benefit AS b
   WHERE  (IdLocale = l.IdLocale) and  b.data=d.dateitem),0) AS [Incentivi],
 
 isnull((SELECT ROUND(SUM(Importo), 2) AS Expr1 FROM Benefit AS b
   WHERE  IdLocale = l.IdLocale),0) AS [Incentivi Totali],
 
 isnull((SELECT ROUND(SUM(TotaleEntrate), 2) AS Expr1 FROM Incassi AS i
 WHERE      (CodiceLocale = l.IdLocale) AND i.data=d.dateitem),0) AS [Tot IN],
 
 isnull((SELECT ROUND(SUM(TotaleUscite), 2) AS Expr1 FROM Incassi AS i
 WHERE      (CodiceLocale = l.IdLocale) AND i.data=d.dateitem),0) AS [Tot OUT],
 
 isnull((SELECT ROUND(SUM(Incasso - IncassoNetto), 2) AS Expr1 FROM  Incassi AS i
 WHERE      (CodiceLocale = l.IdLocale) AND (i.data=d.dateitem)),0) AS [Tot Locale],
 
 isnull((SELECT ROUND(SUM(IncassoNetto), 2) AS Expr1 FROM Incassi AS i
 WHERE      (CodiceLocale = l.IdLocale) AND (i.data=d.dateitem)),0) AS [Tot Societa],
 
 isnull((SELECT ROUND(SUM(ROUND(((i.TotaleEntrate - i.TotaleUscite - i.Tasse - i.Rete - i.AAMS) - i.Incasso),2)), 2) AS Expr1 FROM Incassi AS i
 WHERE      (CodiceLocale = l.IdLocale) and (ROUND(((i.TotaleEntrate - i.TotaleUscite - i.Tasse - i.Rete - i.AAMS) - i.Incasso),2)<>0) AND (i.data=d.dateitem)),0) AS [Scarti],
 
 isnull((SELECT ROUND(SUM(RefillSocieta), 2) AS Expr1 FROM RefillHopper AS r
 WHERE      IdLocale = l.IdLocale and r.RefillSocieta>0 AND r.data=d.dateitem),0) AS [Refill Effettuati],
 
 isnull((SELECT ROUND(SUM(importo), 2) AS Expr1 FROM ChangeHopper AS h
 WHERE IdLocale = h.fkLocale and h.importo>0 AND h.data=d.dateitem),0) AS [Change Inserito],
 
 isnull((SELECT ROUND(SUM(importo)*-1, 2) AS Expr1 FROM ChangeHopper AS h
 WHERE IdLocale = h.fkLocale and h.importo<0 AND h.data=d.dateitem),0) AS [Change Prelevato],
 
 isnull((SELECT ROUND(SUM(RefillSocieta)*-1, 2) AS Expr1 FROM RefillHopper AS r
 WHERE      IdLocale = l.IdLocale and r.RefillSocieta<0 AND r.data=d.dateitem),0) AS [Refill Recuperati],
 
 isnull((SELECT     ROUND(SUM(RefillSocieta)*-1, 2) AS Expr1 FROM  RefillHopper AS r
 WHERE      IdLocale = l.IdLocale AND r.data=d.dateitem),0) AS [Refill Saldo],
 
 isnull((SELECT     ROUND(SUM(TotSocieta), 2) AS Expr1 FROM Hopper AS h
 WHERE      IdLocale = l.IdLocale AND (h.dataDa<=d.dateitem and (h.DataA>=d.dateitem or h.DataA is null))),0) AS [Casse Hopper]
 
 FROM  locali AS l , ALO_Days as d
GO
