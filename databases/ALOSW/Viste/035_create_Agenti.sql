/****** Object:  View [dbo].[Agenti]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Agenti] AS SELECT BizAgenti.*,BizMacro.Name FROM  BizAgenti INNER JOIN BizMacro ON BizAgenti.BizMacro = BizMacro.IdMacro WHERE     (BizAgenti.BizMacro IN (SELECT     usrMacroZone.IdMacro FROM          usrMacroZone INNER JOIN usrUser ON usrMacroZone.IdUser = usrUser.IdUser WHERE      (usrUser.CurrentSpid = @@SPID)))
GO
