/****** Object:  Table [dbo].[Guasti]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Guasti](
	[IdGuasto] [int] IDENTITY(1,1) NOT NULL,
	[IdLocale] [int] NULL,
	[CodiceGuasto] [int] NULL,
	[DataAperturaGuasto] [smalldatetime] NULL,
	[HAperturaGuasto] [int] NULL,
	[MAperturaGuasto] [int] NULL,
	[DataChiusuraGuasto] [smalldatetime] NULL,
	[HChiusuraGuasto] [int] NULL,
	[MChiusuraGuasto] [int] NULL,
	[ParTipoGuasto] [int] NULL,
	[DescGuasto] [char](255) NULL,
	[InPrimaE] [float] NULL,
	[OutPrimaE] [float] NULL,
	[InPrimaM] [float] NULL,
	[OutPrimaM] [float] NULL,
	[InDopoE] [float] NULL,
	[OutDopoE] [float] NULL,
	[InDopoM] [float] NULL,
	[OutDopoM] [float] NULL,
	[StatoInizio] [char](20) NULL,
	[StatoFine] [char](20) NULL,
	[CodiceOggetto] [int] NULL,
	[TipoOggettoDesc] [char](3) NULL,
	[IdIntervento] [int] NULL,
	[NomeApparecchio] [char](50) NULL,
	[Matricola] [varchar](20) NULL,
	[fkTC] [int] NULL,
	[IdMagazzino] [int] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
