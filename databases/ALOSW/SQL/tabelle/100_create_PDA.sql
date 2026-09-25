/****** Object:  Table [dbo].[PDA]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PDA](
	[IdPDA] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](30) NULL,
	[Matricola] [varchar](20) NULL,
	[Tipologia] [int] NULL,
	[IdRete] [int] NULL,
	[IdLocale] [int] NULL,
	[bAllegato] [bit] NULL,
	[bFoto] [bit] NULL,
	[Note] [varchar](255) NULL,
	[DataFine] [smalldatetime] NULL,
	[Attivo] [bit] NULL,
	[IdMagazzino] [int] NULL,
	[prop] [int] NULL,
	[NumDDTScarico] [varchar](30) NULL,
	[DestDDTScarico] [varchar](50) NULL,
	[NumDDT] [varchar](30) NULL,
	[DataDDT] [smalldatetime] NULL,
	[DataDDTScarico] [smalldatetime] NULL,
	[MacAddress] [varchar](50) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
