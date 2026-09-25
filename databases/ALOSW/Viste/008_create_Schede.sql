/****** Object:  View [dbo].[Schede]    Script Date: 11/17/2025 15:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Schede]
AS
SELECT     dbo.bizschede.*, dbo.bizMacro.Name As Name
FROM         dbo.bizschede INNER JOIN
                      dbo.bizMacro ON dbo.bizschede.BizMacro = dbo.bizMacro.IdMacro
WHERE     (dbo.bizschede.BizMacro IN
                          (SELECT     dbo.usrMacroZone.IdMacro
                            FROM          dbo.usrMacroZone INNER JOIN
                                                   dbo.usrUser ON dbo.usrMacroZone.IdUser = dbo.usrUser.IdUser
                            WHERE      (dbo.usrUser.CurrentSpid = @@SPID)))
GO
