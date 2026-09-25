/****** Object:  View [dbo].[Magazzini]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Magazzini] AS SELECT BizMagazzini.*,BizMacro.Name FROM  BizMagazzini INNER JOIN BizMacro ON BizMagazzini.BizMacro = BizMacro.IdMacro WHERE     (BizMagazzini.BizMacro IN (SELECT     usrMacroZone.IdMacro FROM          usrMacroZone INNER JOIN usrUser ON usrMacroZone.IdUser = usrUser.IdUser WHERE      (usrUser.CurrentSpid = @@SPID)))
GO
