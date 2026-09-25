/****** Object:  Table [dbo].[bizdistribut]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bizdistribut](
	[IdDistributore] [int] IDENTITY(1,1) NOT NULL,
	[Codice] [nvarchar](10) NULL,
	[Nome] [nvarchar](30) NULL,
	[Genere] [int] NULL,
	[Fornitore] [int] NULL,
	[Costruttore] [int] NULL,
	[DataAcquisto] [nvarchar](10) NULL,
	[Quantita] [int] NULL,
	[QuantitaInstallata] [int] NULL,
	[LimiteIncasso] [float] NULL,
	[Incasso] [float] NULL,
	[Note] [ntext] NULL,
	[Attivo] [int] NULL,
	[Matricola] [nvarchar](20) NULL,
	[Prop] [int] NULL,
	[Agente] [int] NULL,
	[DataCreazione] [smalldatetime] NULL,
	[DataFine] [smalldatetime] NULL,
	[Zona] [int] NULL,
	[Stat1] [nvarchar](20) NULL,
	[Stat2] [nvarchar](20) NULL,
	[DataFattura] [smalldatetime] NULL,
	[NumFattura] [nvarchar](30) NULL,
	[DataDDT] [smalldatetime] NULL,
	[NumDDT] [nvarchar](30) NULL,
	[TipoAcquisto] [int] NULL,
	[Gettoniere] [int] NULL,
	[NumDDTScarico] [nvarchar](30) NULL,
	[DataDDTScarico] [smalldatetime] NULL,
	[DestDDTScarico] [nvarchar](50) NULL,
	[Premio] [bit] NULL,
	[MarchioCE] [nvarchar](10) NULL,
	[IdMagazzino] [int] NULL,
	[IdEsterno] [int] NULL,
	[NoFattura] [bit] NULL,
	[BizMacro] [int] NULL,
	[CodCespite] [varchar](20) NULL,
	[IdPropApp] [int] NULL,
	[ParCausaleAttivo] [int] NULL,
	[CostoGestInst] [float] NULL,
	[CostoOpMag] [float] NULL,
	[PrezzoAcquisto] [float] NULL
) ON [DATA] TEXTIMAGE_ON [DATA]
GO
SET ANSI_PADDING OFF
GO
