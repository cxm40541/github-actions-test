/****** Object:  View [dbo].[ApparecchiInMagazzino]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ApparecchiInMagazzino] AS  SELECT * FROM ApparecchiNuoviInMagazzino UNION SELECT * FROM ApparecchiUsatiInMagazzino
GO
