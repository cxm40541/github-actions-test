/****** Object:  View [dbo].[ElencoEsattoriAssegnati2]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ElencoEsattoriAssegnati2] AS SELECT LocGiri.Giro AS Giro, LocGiri.Locale AS Locale, LocGiri.Pri AS Pri, LocGiri.Par AS Par, LocGiri.Dis AS Dis, LocGiri.Ord AS Ord, LocGiri.Sec AS Sec, LocGiri.Ter AS Ter, LocGiri.Qua AS Qua, LocGiri.uoq AS uoq, Esattore.*, Giri.* FROM (Esattore INNER JOIN Giri ON Esattore.IdEsattore = Giri.Esattore) INNER JOIN LocGiri ON Giri.IdGiro = LocGiri.Giro
GO
