/****** Object:  View [dbo].[LocaliAttivi]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[LocaliAttivi] AS SELECT IdLocale, Nome, Ind_Comune, Codice From Locali WHERE (DataFine IS NULL) AND (Attivo = 0)
GO
