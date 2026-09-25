/****** Object:  View [dbo].[Forn]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Forn] AS SELECT BizForn.*,BizMacro.Name FROM  BizForn INNER JOIN BizMacro ON BizForn.BizMacro = BizMacro.IdMacro WHERE     (BizForn.BizMacro IN (SELECT     usrMacroZone.IdMacro FROM          usrMacroZone INNER JOIN usrUser ON usrMacroZone.IdUser = usrUser.IdUser WHERE      (usrUser.CurrentSpid = @@SPID)))
GO
