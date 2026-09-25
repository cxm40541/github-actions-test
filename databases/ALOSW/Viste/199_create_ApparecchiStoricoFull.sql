/****** Object:  View [dbo].[ApparecchiStoricoFull]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ApparecchiStoricoFull] AS  SELECT * FROM ApparecchiInstallati UNION SELECT * FROM ApparecchiStorico
GO
