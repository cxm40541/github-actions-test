/****** Object:  Table [dbo].[Results]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Results](
	[ID] [int] NULL,
	[DESCRIZIONE GUASTO] [ntext] NULL,
	[Expr1002] [datetime] NULL,
	[Ora Inizio Guasto Tecnico] [datetime] NULL,
	[Data Inizio Guasto Tecnico] [datetime] NULL,
	[Ora Fine Guasto Tecnico] [datetime] NULL
) ON [DATA] TEXTIMAGE_ON [DATA]
GO
