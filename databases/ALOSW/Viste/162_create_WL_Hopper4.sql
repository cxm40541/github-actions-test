/****** Object:  View [dbo].[WL_Hopper4]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WL_Hopper4] AS SELECT Hopper.IdHopper, hopper.trasferito,Hopper.IdDedicato, Hopper.IdAccessorio, Hopper.IdLocale, Hopper.DataDa, Hopper.DataA, Hopper.NumHopper, 
 Hopper.ParModelloHopper, Hopper.Moneta1, Hopper.Moneta2, Hopper.Moneta3, Hopper.QTAInst1, Hopper.QTAInst2, Hopper.QTAInst3, 
 Hopper.QTAFine1, Hopper.QTAFine2, Hopper.QTAFine3, Hopper.Totale, Hopper.TotSocieta, Hopper.TotLocale, Hopper.NomeApparecchio,
 Hopper.MonetaInst1, Hopper.MonetaInst2, Hopper.MonetaInst3, Hopper.MonetaFine1, Hopper.MonetaFine2, Hopper.MonetaFine3,
 Hopper.TotSocFin, Hopper.TotLocFin, Hopper.IdSocieta, ParModelloHopper.Descrizione,
 Societa.RagioneSociale AS PropApp, Locali.Nome AS MyLoca, Dedicati.Identificativo AS MyAppa, Locali.Codice AS VESE,dedicati.matricola as matricola,Concessionari.NomeConcImp as Concessionario
 FROM ((((Hopper LEFT OUTER JOIN
 ParModelloHopper ON ParModelloHopper.IdPar = Hopper.ParModelloHopper )LEFT OUTER JOIN
 Locali ON Locali.IdLocale = Hopper.IdLocale )INNER JOIN
 Dedicati ON Dedicati.IdDedicato = Hopper.IdDedicato ) LEFT OUTER JOIN
 Societa ON Societa.IdSocieta = Dedicati.Prop) LEFT OUTER JOIN Concessionari on Concessionari.idconcessionario=dedicati.idconcessionario
 WHERE (1 = 1) AND (Hopper.IdAccessorio IS NULL OR
 Hopper.IdAccessorio = 0)
 UNION SELECT Hopper_1.IdHopper, hopper_1.trasferito,Hopper_1.IdDedicato, Hopper_1.IdAccessorio, Hopper_1.IdLocale, Hopper_1.DataDa, Hopper_1.DataA, Hopper_1.NumHopper,
 Hopper_1.ParModelloHopper, Hopper_1.Moneta1, Hopper_1.Moneta2, Hopper_1.Moneta3, Hopper_1.QTAInst1, Hopper_1.QTAInst2, Hopper_1.QTAInst3,
 Hopper_1.QTAFine1, Hopper_1.QTAFine2, Hopper_1.QTAFine3, Hopper_1.Totale, Hopper_1.TotSocieta, Hopper_1.TotLocale, Hopper_1.NomeApparecchio,
 Hopper_1.MonetaInst1, Hopper_1.MonetaInst2, Hopper_1.MonetaInst3, Hopper_1.MonetaFine1, Hopper_1.MonetaFine2, Hopper_1.MonetaFine3, Hopper_1.TotSocFin,
 Hopper_1.TotLocFin, Hopper_1.IdSocieta, ParModelloHopper_1.Descrizione,  Societa_1.RagioneSociale AS PropApp,
 Locali_1.Nome AS MyLoca, Accessori.Matricola AS MyAppa, Locali_1.Codice AS VESE,accessori.matricola as matricola,'-' as Concessionario
 FROM (((Hopper AS Hopper_1 LEFT OUTER JOIN
 ParModelloHopper AS ParModelloHopper_1 ON ParModelloHopper_1.IdPar = Hopper_1.ParModelloHopper )LEFT OUTER JOIN
 Locali AS Locali_1 ON Locali_1.IdLocale = Hopper_1.IdLocale )INNER JOIN
 Accessori ON Accessori.IdAccessorio = Hopper_1.IdAccessorio )LEFT OUTER JOIN
 Societa AS Societa_1 ON Societa_1.IdSocieta = Accessori.Prop
 WHERE (1 = 1) AND (Hopper_1.IdDedicato IS NULL OR
 Hopper_1.IdDedicato = 0);
GO
