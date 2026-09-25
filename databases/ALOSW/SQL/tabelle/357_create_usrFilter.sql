/****** Object:  Table [dbo].[usrFilter]    Script Date: 11/17/2025 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usrFilter](
	[IdFilter] [int] IDENTITY(1,1) NOT NULL,
	[NodeKey] [nvarchar](10) NULL,
	[FilterCaption] [nvarchar](200) NULL,
	[FilterType] [int] NULL,
	[ControlName] [nvarchar](50) NULL,
	[Confronto] [nvarchar](10) NULL,
	[Value1] [nvarchar](50) NULL,
	[Value2] [nvarchar](50) NULL,
	[Value3] [nvarchar](50) NULL,
	[Value4] [nvarchar](50) NULL,
	[Value5] [nvarchar](50) NULL
) ON [DATA]
GO
