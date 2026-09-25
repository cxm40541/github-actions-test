/****** Object:  View [dbo].[NomiLocali2]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[NomiLocali2] AS SELECT IdLocale, Nome AS NomeLocale, Codice AS CodiceLocale FROM Locali
GO
