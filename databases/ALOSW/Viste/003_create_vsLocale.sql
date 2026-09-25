/****** Object:  View [dbo].[vsLocale]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vsLocale] AS SELECT tbLocale.*,BizMacro.Name FROM  tbLocale INNER JOIN BizMacro ON tbLocale.fkMacro = BizMacro.IdMacro WHERE     (tbLocale.fkMacro IN (SELECT     usrMacroZone.IdMacro FROM          usrMacroZone INNER JOIN usrUser ON usrMacroZone.IdUser = usrUser.IdUser WHERE      (usrUser.CurrentSpid = @@SPID)))
GO
