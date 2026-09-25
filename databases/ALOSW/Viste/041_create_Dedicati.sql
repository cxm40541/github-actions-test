/****** Object:  View [dbo].[Dedicati]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Dedicati] AS SELECT BizDedicati.*,BizMacro.Name FROM  BizDedicati INNER JOIN BizMacro ON BizDedicati.BizMacro = BizMacro.IdMacro WHERE     (BizDedicati.BizMacro IN (SELECT     usrMacroZone.IdMacro FROM          usrMacroZone INNER JOIN usrUser ON usrMacroZone.IdUser = usrUser.IdUser WHERE      (usrUser.CurrentSpid = @@SPID)))
GO
