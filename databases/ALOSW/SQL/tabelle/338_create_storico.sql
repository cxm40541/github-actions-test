/****** Object:  Table [dbo].[storico]    Script Date: 11/17/2025 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[storico](
	[IdStorico] [int] IDENTITY(1,1) NOT NULL,
	[Codice] [nvarchar](10) NULL,
	[Tipo] [smallint] NULL,
	[CodiceLocale] [int] NULL,
	[CodiceOggetto] [int] NULL,
	[Incasso] [int] NULL,
	[nDataInizio] [smalldatetime] NULL,
	[nDataFine] [smalldatetime] NULL
) ON [DATA]
GO
