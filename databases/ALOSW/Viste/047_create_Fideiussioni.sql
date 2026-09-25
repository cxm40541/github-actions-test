/****** Object:  View [dbo].[Fideiussioni]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Fideiussioni] AS SELECT bizFideiussioni.*,BizMacro.Name FROM  bizFideiussioni INNER JOIN BizMacro ON bizFideiussioni.BizMacro = BizMacro.IdMacro WHERE     (bizFideiussioni.BizMacro IN (SELECT     usrMacroZone.IdMacro FROM          usrMacroZone INNER JOIN usrUser ON usrMacroZone.IdUser = usrUser.IdUser WHERE      (usrUser.CurrentSpid = @@SPID)))
GO
