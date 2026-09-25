/****** Object:  Table [dbo].[Richieste]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Richieste](
	[IdRichiesta] [int] IDENTITY(1,1) NOT NULL,
	[IdGestore] [int] NULL,
	[NomeLocale] [varchar](100) NULL,
	[NumProt] [varchar](100) NULL,
	[Data] [smalldatetime] NULL,
	[CodRice] [varchar](20) NULL,
	[Note] [varchar](255) NULL,
	[bEvasa] [bit] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
