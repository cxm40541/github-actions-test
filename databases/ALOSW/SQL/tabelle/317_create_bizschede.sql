/****** Object:  Table [dbo].[bizschede]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bizschede](
	[IdScheda] [int] IDENTITY(1,1) NOT NULL,
	[Codice] [nvarchar](10) NULL,
	[Nome] [nvarchar](30) NULL,
	[AnnoUscita] [nvarchar](10) NULL,
	[Costruttore] [int] NULL,
	[Genere] [int] NULL,
	[Fornitore] [int] NULL,
	[Caratteristiche] [nvarchar](20) NULL,
	[Quantita] [smallint] NULL,
	[QuantitaInstallata] [smallint] NULL,
	[CategoriaPrezzo] [float] NULL,
	[LimiteIncasso] [float] NULL,
	[Incasso] [int] NULL,
	[Note] [ntext] NULL,
	[Attivo] [int] NULL,
	[Matricola] [nvarchar](20) NULL,
	[Prop] [int] NULL,
	[Agente] [int] NULL,
	[DataCreazione] [smalldatetime] NULL,
	[DataFine] [smalldatetime] NULL,
	[Zona] [smallint] NULL,
	[Premio] [bit] NULL,
	[Stat1] [nvarchar](20) NULL,
	[Stat2] [nvarchar](20) NULL,
	[DataFattura] [smalldatetime] NULL,
	[NumFattura] [nvarchar](30) NULL,
	[DataDDT] [smalldatetime] NULL,
	[NumDDT] [nvarchar](30) NULL,
	[TipoAcquisto] [int] NULL,
	[NumDDTScarico] [nvarchar](30) NULL,
	[DataDDTScarico] [smalldatetime] NULL,
	[DestDDTScarico] [nvarchar](50) NULL,
	[MarchioCE] [nvarchar](10) NULL,
	[IdMagazzino] [int] NULL,
	[IdEsterno] [int] NULL,
	[IdMobile] [int] NULL,
	[NoFattura] [bit] NULL,
	[BizMacro] [int] NULL
) ON [DATA] TEXTIMAGE_ON [DATA]
GO
