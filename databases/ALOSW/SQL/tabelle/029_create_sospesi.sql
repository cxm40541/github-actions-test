/****** Object:  Table [dbo].[sospesi]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sospesi](
	[CodLoc] [nvarchar](10) NULL,
	[Data] [smalldatetime] NULL,
	[Desc] [nvarchar](80) NULL,
	[Importo] [int] NULL
) ON [DATA]
GO
