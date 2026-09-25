/****** Object:  View [dbo].[vAssegni]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vAssegni] AS SELECT     assegni.*, locali.nome AS Traente, societa.ragionesociale 
FROM         (Assegni INNER JOIN 
locali ON assegni.idlocale = locali.idlocale) LEFT JOIN 
societa ON societa.idsocieta = assegni.idsocieta 
Union 
SELECT     assegni.*, emessoda AS Traente, ragionesociale 
FROM         (assegni LEFT JOIN 
societa ON societa.idsocieta = assegni.idsocieta) 
WHERE     idlocale IS NULL OR 
NOT idlocale > 0
GO
