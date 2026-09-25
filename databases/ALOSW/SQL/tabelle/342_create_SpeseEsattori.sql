/****** Object:  Table [dbo].[SpeseEsattori]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SpeseEsattori](
	[IdSpeseEsattore] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [char](100) NULL,
	[IdEsattore] [int] NULL,
	[Spesa] [float] NULL,
	[Descrizione] [char](250) NULL,
	[DataSpesa] [smalldatetime] NULL,
	[IdLocale] [int] NULL,
	[Tipo] [varchar](1) NULL,
	[BollettaIncasso] [int] NULL,
	[ParTipo] [int] NULL,
	[Rif] [varchar](100) NULL,
	[Progressivo] [varchar](100) NULL,
	[Verificato] [bit] NULL,
	[VerificaFkUser] [int] NULL,
	[VerificaData] [smalldatetime] NULL,
	[VerificaImporto] [float] NULL,
	[VerificaNota] [varchar](250) NULL,
	[Trasferito] [int] NULL,
	[Sezionale] [int] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
