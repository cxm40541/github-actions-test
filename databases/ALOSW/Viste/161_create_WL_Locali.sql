/****** Object:  View [dbo].[WL_Locali]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WL_Locali] AS SELECT locali.*, Descrizione, ragionesociale FROM (Locali LEFT JOIN pargenerelocale ON locali.genere=pargenerelocale.idpar) LEFT JOIN Societa ON Societa.idsocieta=Locali.prop WHERE DataFine Is Null
GO
