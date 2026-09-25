/****** Object:  View [dbo].[Articoli]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Articoli] AS SELECT BizArticoli.*,BizMacro.Name FROM  BizArticoli INNER JOIN BizMacro ON BizArticoli.BizMacro = BizMacro.IdMacro WHERE     (BizArticoli.BizMacro IN (SELECT     usrMacroZone.IdMacro FROM          usrMacroZone INNER JOIN usrUser ON usrMacroZone.IdUser = usrUser.IdUser WHERE      (usrUser.CurrentSpid = @@SPID)))
GO
