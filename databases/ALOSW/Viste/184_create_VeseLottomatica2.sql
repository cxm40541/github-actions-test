/****** Object:  View [dbo].[VeseLottomatica2]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VeseLottomatica2] AS SELECT IdLocale, 
 CASE WHEN CASE WHEN CodConc1 LIKE '%V%' THEN CodConc1 ELSE '' END + CASE WHEN CodConc2 LIKE '%V%' THEN CodConc2 ELSE '' END + CASE WHEN CodConc3 
 LIKE '%V%' THEN CodConc3 ELSE '' END + CASE WHEN CodConc4 LIKE '%V%' THEN CodConc4 ELSE '' END + CASE WHEN CodConc5 LIKE '%V%' THEN 
 CodConc5 ELSE '' END + CASE WHEN CodConc6 LIKE '%V%' THEN CodConc6 ELSE '' END + CASE WHEN CodConc7 LIKE '%V%' THEN CodConc7 ELSE 
 '' END + CASE WHEN CodConc8 LIKE '%V%' THEN CodConc8 ELSE '' END + CASE WHEN CodConc9 LIKE '%V%' THEN CodConc9 ELSE '' END + CASE WHEN 
 CodConc10 LIKE '%V%' THEN CodConc10 ELSE '' END = '' THEN Locali.Codice END AS Vese 
 From Locali
GO
