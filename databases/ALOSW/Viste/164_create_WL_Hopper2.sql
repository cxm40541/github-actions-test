/****** Object:  View [dbo].[WL_Hopper2]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WL_Hopper2] AS SELECT hopper.*, parmodellohopper.descrizione, BizMacro.Name as Macro,Societa.RagioneSociale as PropApp ,locali.nome as MyLoca, Dedicati.Identificativo AS MyAppa,Locali.Codice as VESE FROM ((((hopper LEFT JOIN  parmodellohopper ON parmodellohopper.idpar = hopper.parmodellohopper) LEFT JOIN locali ON locali.idlocale = hopper.idlocale) LEFT JOIN Dedicati ON Dedicati.IdDedicato = Hopper.IdDedicato )LEFT JOIN Societa ON Societa.IdSocieta = Dedicati.prop)LEFT JOIN BizMacro ON Dedicati.BizMacro = BizMacro.IdMacro WHERE 1 = 1 AND (Hopper.IdAccessorio IS NULL OR Hopper.IdAccessorio = 0) UNION  SELECT hopper.*, parmodellohopper.descrizione,BizMacro.Name as Macro,Societa.RagioneSociale as PropApp ,locali.nome as MyLoca, Accessori.Matricola AS MyAppa, Locali.Codice as VESE FROM ((((hopper LEFT JOIN parmodellohopper ON parmodellohopper.idpar = hopper.parmodellohopper) LEFT JOIN locali ON locali.idlocale = hopper.idlocale) LEFT JOIN Accessori ON Accessori.IdAccessorio = Hopper.IdAccessorio) LEFT JOIN Societa ON Societa.IdSocieta = Accessori.prop)LEFT JOIN BizMacro ON Accessori.BizMacro = BizMacro.IdMacro  WHERE 1 = 1 AND (Hopper.IdDedicato IS NULL OR Hopper.IdDedicato = 0)
GO
