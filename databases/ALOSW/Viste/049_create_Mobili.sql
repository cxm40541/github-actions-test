/****** Object:  View [dbo].[Mobili]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Mobili]
AS
SELECT     dbo.bizmobili.*, dbo.bizMacro.Name As Name
FROM         dbo.bizmobili INNER JOIN
                      dbo.bizMacro ON dbo.bizmobili.BizMacro = dbo.bizMacro.IdMacro
WHERE     (dbo.bizmobili.BizMacro IN
                          (SELECT     dbo.usrMacroZone.IdMacro
                            FROM          dbo.usrMacroZone INNER JOIN
                                                   dbo.usrUser ON dbo.usrMacroZone.IdUser = dbo.usrUser.IdUser
                            WHERE      (dbo.usrUser.CurrentSpid = @@SPID)))
GO
