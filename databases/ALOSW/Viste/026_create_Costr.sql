/****** Object:  View [dbo].[Costr]    Script Date: 11/17/2025 15:16:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Costr]
AS
SELECT     dbo.bizcostr.*, dbo.bizMacro.Name AS Name
FROM         dbo.bizcostr INNER JOIN
                      dbo.bizMacro ON dbo.bizcostr.BizMacro = dbo.bizMacro.IdMacro
WHERE     (dbo.bizcostr.BizMacro IN
                          (SELECT     dbo.usrMacroZone.IdMacro
                            FROM          dbo.usrMacroZone INNER JOIN
                                                   dbo.usrUser ON dbo.usrMacroZone.IdUser = dbo.usrUser.IdUser
                            WHERE      (dbo.usrUser.CurrentSpid = @@SPID)))
GO
