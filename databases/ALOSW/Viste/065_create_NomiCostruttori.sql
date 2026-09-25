/****** Object:  View [dbo].[NomiCostruttori]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[NomiCostruttori]
AS
SELECT     IdCostruttore, Nome AS NomeCostruttore
FROM         dbo.costr
GO
