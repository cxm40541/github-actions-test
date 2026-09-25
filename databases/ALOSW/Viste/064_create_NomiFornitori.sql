/****** Object:  View [dbo].[NomiFornitori]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[NomiFornitori]
AS
SELECT     IdFornitore, Nome AS NomeFornitore
FROM         dbo.forn
GO
