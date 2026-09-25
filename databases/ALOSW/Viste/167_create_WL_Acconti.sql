/****** Object:  View [dbo].[WL_Acconti]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[WL_Acconti] AS SELECT Acconti.*, Locali.Nome, 'Prelevato' as Tipo FROM Acconti, Locali WHERE Locali.IdLocale = Acconti.CodiceLocale and Importo > 0 UNION  SELECT Acconti.*, Locali.Nome, 'Utilizzato' as Tipo FROM Acconti, Locali WHERE Locali.IdLocale = Acconti.CodiceLocale and Importo < 0
GO
