/****** Object:  View [dbo].[MyIncassiTemp]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[MyIncassiTemp] AS SELECT MAX(IdMobile_action) AS MyAction, IdOggetto From IncassiTmp GROUP BY IdOggetto
GO
