/****** Object:  Table [dbo].[RelReportConfig]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RelReportConfig](
	[IdRel] [int] IDENTITY(1,1) NOT NULL,
	[FkReport] [int] NULL,
	[sFields] [varchar](50) NULL,
	[sAlias] [varchar](50) NULL,
	[SwFilter] [bit] NULL,
	[SwFormula] [bit] NULL,
	[Formula] [varchar](200) NULL,
	[SwOrder] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
