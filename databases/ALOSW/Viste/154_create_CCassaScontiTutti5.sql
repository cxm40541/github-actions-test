/****** Object:  View [dbo].[CCassaScontiTutti5]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CCassaScontiTutti5] AS  SELECT data, 'Corrispettivi Società' AS descrizione, sum(incassonetto) AS Entrate, 0 AS uscite From incassi, Locali Where incassi.CodiceLocale = Locali.IdLocale GROUP BY data 
 Union SELECT data, 'Preu incassato' AS descrizione, sum(tasse) AS Entrate, 0 AS uscite From incassi, Locali Where Tasse <> 0 And incassi.CodiceLocale = Locali.IdLocale GROUP BY data 
 Union SELECT data, 'AAMS incassato' AS descrizione, sum(AAMS) AS Entrate, 0 AS uscite From incassi, Locali Where AAMS <> 0 And incassi.CodiceLocale = Locali.IdLocale GROUP BY data 
 Union SELECT data, 'Rete incassata' AS descrizione, sum(RETE) AS Entrate, 0 AS uscite From incassi, Locali Where Rete <> 0 And incassi.CodiceLocale = Locali.IdLocale GROUP BY data 
 Union SELECT data, 'Sospesi' AS descrizione, 0 AS Entrate, sum(abs(importo)) AS uscite From sospesirientri, Locali Where sospesirientri.Importo < 0 And sospesirientri.CodiceLocale = Locali.IdLocale GROUP BY data 
 Union SELECT data, 'Recuperi' AS descrizione, sum(importo) AS Entrate, 0 AS uscite From sospesirientri, Locali Where sospesirientri.Importo > 0 And sospesirientri.CodiceLocale = Locali.IdLocale GROUP BY data 
 Union SELECT datada AS data, 'Cariche Iniziali' AS descrizione, 0 AS Entrate, sum(totsocieta) AS uscite From Hopper, Locali Where TotSocieta <> 0 And Not TotSocieta Is Null And Hopper.IdLocale = Locali.IdLocale GROUP BY datada 
 Union SELECT dataa AS data, 'Cariche Finali' AS descrizione, sum(totsocfin) AS Entrate, 0 AS uscite From Hopper, Locali Where totsocfin <> 0 And Not totsocfin Is Null And Hopper.IdLocale = Locali.IdLocale GROUP BY dataa 
 Union SELECT data, 'Refill Recuperati' AS Descrizione, sum(abs(refillsocieta)) AS Entrate, 0 AS uscite From RefillHopper, Hopper WHERE refillhopper.refillsocieta < 0 and RefillHopper.IdHopper = Hopper.IdHopper and hopper.IdLocale in (select IdLocale from locali) GROUP BY data 
 Union SELECT data, 'Refill Generati' AS Descrizione, 0 AS Entrate, sum(abs(refillsocieta)) AS uscite From RefillHopper, Hopper WHERE refillhopper.refillsocieta > 0 and RefillHopper.IdHopper = Hopper.IdHopper and hopper.IdLocale in (select IdLocale from locali) GROUP BY data 
 Union SELECT data, 'Uscite Cassa' AS Descrizione, 0 AS Entrate, sum(uscita) AS Uscite From cOperazione Where Uscita > 0 GROUP BY data 
 Union SELECT data, 'Acconti Utilizzati' AS descrizione, 0 AS Entrate, sum(abs(importo)) AS uscite From Acconti, Locali Where Acconti.Importo < 0 And Acconti.CodiceLocale = Locali.IdLocale GROUP BY data 
 Union SELECT data, 'Acconti Prelevati' AS descrizione, sum(importo) AS Entrate, 0 AS uscite From Acconti, Locali Where Acconti.Importo > 0 And Acconti.CodiceLocale = Locali.IdLocale GROUP BY data
GO
