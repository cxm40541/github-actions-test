/****** Object:  Table [dbo].[Progressivi]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Progressivi](
	[Tipo] [smallint] NULL,
	[Numero] [int] NULL,
	[bizMacro] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Sezionale] [int] NULL,
	[SezionaleText] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
