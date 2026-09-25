/****** Object:  View [dbo].[NomiLocali]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[NomiLocali]
AS
SELECT     IdLocale, Nome AS NomeLocale
FROM         dbo.locali
GO
