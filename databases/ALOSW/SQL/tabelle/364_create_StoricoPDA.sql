/****** Object:  Table [dbo].[StoricoPDA]    Script Date: 11/17/2025 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StoricoPDA](
	[IdStorico] [int] IDENTITY(1,1) NOT NULL,
	[Codice] [varchar](10) NULL,
	[Tipo] [int] NULL,
	[CodiceLocale] [int] NULL,
	[CodiceOggetto] [int] NULL,
	[Incasso] [int] NULL,
	[nDataInizio] [smalldatetime] NULL,
	[nDataFine] [smalldatetime] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
