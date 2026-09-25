/****** Object:  Table [dbo].[usrUserFilter]    Script Date: 11/17/2025 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usrUserFilter](
	[IdUser] [int] NOT NULL,
	[IdFilter] [int] NULL,
	[NodeKey] [nvarchar](10) NULL,
	[Value] [nvarchar](50) NULL,
	[SQL] [nvarchar](50) NULL
) ON [DATA]
GO
