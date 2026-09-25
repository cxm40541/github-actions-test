/****** Object:  View [dbo].[WL_Hopper]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WL_Hopper] AS SELECT hopper.*, parmodellohopper.descrizione, locali.nome, Dedicati.Identificativo AS MyAppa FROM ((hopper LEFT JOIN  parmodellohopper ON parmodellohopper.idpar = hopper.parmodellohopper) LEFT JOIN locali ON locali.idlocale = hopper.idlocale) LEFT JOIN Dedicati ON Dedicati.IdDedicato = Hopper.IdDedicato WHERE 1 = 1 AND (Hopper.IdAccessorio IS NULL OR Hopper.IdAccessorio = 0) UNION  SELECT hopper.*, parmodellohopper.descrizione, locali.nome, Accessori.Matricola AS MyAppa FROM  ((hopper LEFT JOIN parmodellohopper ON parmodellohopper.idpar = hopper.parmodellohopper) LEFT JOIN locali ON locali.idlocale = hopper.idlocale) LEFT JOIN Accessori ON Accessori.IdAccessorio = Hopper.IdAccessorio WHERE 1 = 1 AND (Hopper.IdDedicato IS NULL OR Hopper.IdDedicato = 0)
GO
