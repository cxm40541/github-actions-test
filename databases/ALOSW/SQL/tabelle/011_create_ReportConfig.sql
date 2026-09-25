/****** Object:  Table [dbo].[ReportConfig]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ReportConfig](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[sTitle] [varchar](150) NULL,
	[sQuery] [varchar](8000) NULL,
	[sType] [int] NULL,
	[sUser] [varchar](60) NULL,
	[sWhere] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
