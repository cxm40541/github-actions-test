/****** Object:  View [dbo].[Concessionari]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Concessionari] AS SELECT BizConcessionari.*,BizMacro.Name FROM  BizConcessionari INNER JOIN BizMacro ON BizConcessionari.BizMacro = BizMacro.IdMacro WHERE     (BizConcessionari.BizMacro IN (SELECT     usrMacroZone.IdMacro FROM          usrMacroZone INNER JOIN usrUser ON usrMacroZone.IdUser = usrUser.IdUser WHERE      (usrUser.CurrentSpid = @@SPID)))
GO
