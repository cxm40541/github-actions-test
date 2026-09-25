/****** Object:  View [dbo].[PrimeInstallazioni2Parte1]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PrimeInstallazioni2Parte1] AS SELECT S1.* FROM Spostamenti AS S1 WHERE S1.IdDedicato>0 AND S1.TipoDa=0 AND S1.IdSpostamento IN (SELECT TOP 1 IdSpostamento FROM Spostamenti AS S2 WHERE S2.IdDedicato=S1.IdDedicato ORDER BY S2.Data,S2.IdSpostamento)
GO
