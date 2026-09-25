/****** Object:  View [dbo].[SospNullaOsta]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SospNullaOsta] AS SELECT S1.* FROM Spostamenti AS S1 WHERE S1.IdDedicato>0 AND S1.TipoA=0 AND S1.IdSpostamento IN (SELECT TOP 1 IdSpostamento FROM Spostamenti AS S2 WHERE S2.IdDedicato=S1.IdDedicato ORDER BY S2.Data desc,S2.IdSpostamento) UNION SELECT S3.* FROM Spostamenti AS S3 WHERE S3.IdMobile>0 AND S3.TipoA=0 AND S3.IdSpostamento IN (SELECT TOP 1 IdSpostamento FROM Spostamenti AS S4 WHERE S4.IdMobile=S3.IdMobile ORDER BY S4.Data desc,S4.IdSpostamento)
GO
