/****** Object:  Table [dbo].[bizmobili]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bizmobili](
	[IdMobile] [int] IDENTITY(1,1) NOT NULL,
	[Codice] [nvarchar](10) NULL,
	[Modello] [nvarchar](30) NULL,
	[TipoMonitor] [int] NULL,
	[TipoAlimentat] [int] NULL,
	[Cablaggio] [int] NULL,
	[Reversibile] [bit] NULL,
	[Quantita] [smallint] NULL,
	[QuantitaInstallata] [smallint] NULL,
	[Gettoniere] [int] NULL,
	[Caratteristiche] [nvarchar](20) NULL,
	[NeoGeo] [nvarchar](1) NULL,
	[NumeroNeoGeo] [smallint] NULL,
	[Note] [ntext] NULL,
	[Attivo] [int] NULL,
	[Matricola] [nvarchar](20) NULL,
	[Prop] [int] NULL,
	[Agente] [int] NULL,
	[DataCreazione] [smalldatetime] NULL,
	[DataFine] [smalldatetime] NULL,
	[Zona] [smallint] NULL,
	[Costruttore] [int] NULL,
	[Fornitore] [int] NULL,
	[DataFattura] [smalldatetime] NULL,
	[NumFattura] [nvarchar](30) NULL,
	[DataDDT] [smalldatetime] NULL,
	[NumDDT] [nvarchar](30) NULL,
	[TipoAcquisto] [int] NULL,
	[Premio] [bit] NULL,
	[NumDDTScarico] [nvarchar](30) NULL,
	[DataDDTScarico] [smalldatetime] NULL,
	[DestDDTScarico] [nvarchar](50) NULL,
	[MarchioCE] [nvarchar](10) NULL,
	[IdMagazzino] [int] NULL,
	[IdEsterno] [int] NULL,
	[NullaOsta] [nvarchar](20) NULL,
	[Identificativo] [nvarchar](20) NULL,
	[ParTipologiaMonopoli] [int] NULL,
	[IdScheda] [int] NULL,
	[DataRilascioNullaOsta] [smalldatetime] NULL,
	[BizMacro] [int] NULL,
	[CostoGestInst] [float] NULL,
	[CostoOpMag] [float] NULL,
	[PrezzoAcquisto] [float] NULL,
	[IdPropApp] [int] NULL,
	[CodCespite] [varchar](20) NULL
) ON [DATA] TEXTIMAGE_ON [DATA]
GO
SET ANSI_PADDING OFF
GO
