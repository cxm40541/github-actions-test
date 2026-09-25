/****** Object:  Table [dbo].[usrTreeView]    Script Date: 11/17/2025 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usrTreeView](
	[IdUser] [int] NOT NULL,
	[NodeKey] [nvarchar](10) NULL,
	[CanAdd] [bit] NOT NULL,
	[CanEdit] [bit] NOT NULL,
	[CanDelete] [bit] NOT NULL,
	[CanPrint] [bit] NOT NULL,
	[CanExport] [bit] NOT NULL
) ON [DATA]
GO
