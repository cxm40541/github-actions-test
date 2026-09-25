/****** Object:  Table [dbo].[SospesiRientri]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SospesiRientri](
	[IdSospeso] [int] IDENTITY(1,1) NOT NULL,
	[codicelocale] [int] NULL,
	[Data] [smalldatetime] NULL,
	[BollettaIncasso] [int] NULL,
	[Importo] [float] NULL,
	[IdPar] [int] NULL,
	[Note] [varchar](255) NULL,
	[Trasferito] [int] NULL,
	[IdEsattore] [int] NULL,
	[TipoSospeso] [int] NULL,
	[ParMacroSospeso] [int] NULL,
	[ParModalita] [int] NULL,
	[DataEsigibilita] [smalldatetime] NULL,
	[NonEsigibile] [bit] NULL,
	[Estremi] [varchar](50) NULL,
	[SWIncasso] [int] NULL,
	[IdSocieta] [int] NULL,
	[swBonificato] [bit] NULL,
	[Sezionale] [int] NULL,
	[swStabilita] [bit] NULL,
	[MacroConc] [varchar](250) NULL,
	[FkStabilita] [int] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
