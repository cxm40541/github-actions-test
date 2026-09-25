/****** Object:  View [dbo].[Esattore]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Esattore] AS SELECT BizEsattore.*,BizMacro.Name FROM  BizEsattore INNER JOIN BizMacro ON BizEsattore.BizMacro = BizMacro.IdMacro WHERE     (BizEsattore.BizMacro IN (SELECT     usrMacroZone.IdMacro FROM          usrMacroZone INNER JOIN usrUser ON usrMacroZone.IdUser = usrUser.IdUser WHERE      (usrUser.CurrentSpid = @@SPID)))
GO
