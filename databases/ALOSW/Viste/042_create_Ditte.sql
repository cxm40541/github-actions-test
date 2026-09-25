/****** Object:  View [dbo].[Ditte]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Ditte]
AS
SELECT     dbo.bizDitte.*, dbo.bizMacro.Name As Name
FROM         dbo.bizDitte INNER JOIN
                      dbo.bizMacro ON dbo.bizDitte.BizMacro = dbo.bizMacro.IdMacro
WHERE     (dbo.bizDitte.BizMacro IN
                          (SELECT     dbo.usrMacroZone.IdMacro
                            FROM          dbo.usrMacroZone INNER JOIN
                                                   dbo.usrUser ON dbo.usrMacroZone.IdUser = dbo.usrUser.IdUser
                            WHERE      (dbo.usrUser.CurrentSpid = @@SPID)))
GO
