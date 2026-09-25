/****** Object:  View [dbo].[LastChangeLivelli]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[LastChangeLivelli] AS  SELECT cl.*  FROM ChangeLivelli AS cl INNER JOIN (SELECT FkChange, MAX(PkChangeLivelli) AS MyPkLivelli FROM ChangeLivelli GROUP BY FkChange) AS LastCL ON cl.PkChangeLivelli = LastCL.MyPkLivelli
GO
