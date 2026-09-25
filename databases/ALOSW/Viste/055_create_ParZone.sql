/****** Object:  View [dbo].[ParZone]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ParZone]
AS
SELECT     dbo.bizParZone.*, dbo.bizMacro.Name AS Name
FROM         dbo.bizParZone INNER JOIN
                      dbo.bizMacro ON dbo.bizParZone.BizMacro = dbo.bizMacro.IdMacro
WHERE     (dbo.bizParZone.BizMacro IN
                          (SELECT     dbo.usrMacroZone.IdMacro
                            FROM          dbo.usrMacroZone INNER JOIN
                                                   dbo.usrUser ON dbo.usrMacroZone.IdUser = dbo.usrUser.IdUser
                            WHERE      (dbo.usrUser.CurrentSpid = @@SPID)))
GO
