/****** Object:  Table [dbo].[mobile_print]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mobile_print](
	[IdPrint] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NULL,
	[Titolo] [varchar](250) NULL,
	[Area] [varchar](50) NULL,
	[LastUpdate] [smalldatetime] NULL,
	[Attivo] [bit] NULL,
	[Template] [varchar](8000) NULL,
	[Html] [varchar](8000) NULL,
	[CodeAlo] [varchar](50) NULL,
	[ToDelete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPrint] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
