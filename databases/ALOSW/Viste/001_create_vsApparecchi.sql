/****** Object:  View [dbo].[vsApparecchi]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vsApparecchi] AS SELECT tbApparecchi.*,BizMacro.Name FROM  tbApparecchi INNER JOIN BizMacro ON tbApparecchi.fkMacro = BizMacro.IdMacro WHERE     (tbApparecchi.fkMacro IN (SELECT     usrMacroZone.IdMacro FROM          usrMacroZone INNER JOIN usrUser ON usrMacroZone.IdUser = usrUser.IdUser WHERE      (usrUser.CurrentSpid = @@SPID)))
GO
