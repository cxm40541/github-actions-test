/****** Object:  Table [dbo].[MovePda]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MovePda](
	[IdMove] [int] IDENTITY(1,1) NOT NULL,
	[Codice] [varchar](10) NULL,
	[DataCambio] [smalldatetime] NULL,
	[DataFine] [varchar](10) NULL,
	[Locale] [int] NULL,
	[ndata] [smalldatetime] NULL,
	[PDA] [int] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
