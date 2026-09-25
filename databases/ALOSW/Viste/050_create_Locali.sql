/****** Object:  View [dbo].[Locali]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Locali] AS SELECT BizLocali.*,BizMacro.Name FROM  BizLocali INNER JOIN BizMacro ON BizLocali.BizMacro = BizMacro.IdMacro WHERE     (BizLocali.BizMacro IN (SELECT     usrMacroZone.IdMacro FROM          usrMacroZone INNER JOIN usrUser ON usrMacroZone.IdUser = usrUser.IdUser WHERE      (usrUser.CurrentSpid = @@SPID)))
GO
