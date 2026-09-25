/****** Object:  Table [dbo].[Ricambi]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ricambi](
	[IdRicambio] [int] IDENTITY(1,1) NOT NULL,
	[NomeRicambio] [varchar](100) NULL,
	[IdCostruttore] [int] NULL,
	[IdFornitore] [int] NULL,
	[Descrizione] [char](255) NULL,
	[Quantita] [int] NULL,
	[Sottoscorta] [int] NULL,
	[IdMagazzino] [int] NULL,
	[DataUltimoCarico] [smalldatetime] NULL,
	[DataUltimoScarico] [smalldatetime] NULL,
	[tiporicambio] [varchar](1) NULL,
	[IdParTipologia] [int] NULL,
	[codice] [varchar](50) NULL,
	[codicefornitore] [varchar](50) NULL,
	[serie] [varchar](50) NULL,
	[marca] [varchar](50) NULL,
	[matricola] [varchar](50) NULL,
	[Idparunitamisura] [int] NULL,
	[costounitario] [float] NULL,
	[prezzovenditaA] [float] NULL,
	[prezzovenditaB] [float] NULL,
	[ivapercentuale] [float] NULL,
	[datainserimento] [smalldatetime] NULL,
	[dataultimamov] [smalldatetime] NULL,
	[TipoLuogoInstallazione] [varchar](10) NULL,
	[IdApparecchio] [int] NULL,
	[TipoOggetto] [int] NULL,
	[idluogo] [int] NULL,
	[DataFine] [smalldatetime] NULL,
	[PrezzoUnitario] [float] NULL,
	[DataAcquisto] [smalldatetime] NULL,
	[Colore] [varchar](50) NULL,
	[Note] [varchar](250) NULL,
	[NumFattura] [varchar](50) NULL,
	[NumDDT] [varchar](50) NULL,
	[bTemporaneo] [bit] NULL,
	[DataCambioTipologia] [smalldatetime] NULL,
	[IdParTipologiaOld] [int] NULL,
	[ODA] [varchar](50) NULL,
	[RDA] [varchar](50) NULL,
	[LastUpdate] [smalldatetime] NULL,
	[IdCategoria] [int] NULL,
	[FkGruppo] [int] NULL,
	[DataDdt] [smalldatetime] NULL,
	[swModificato] [bit] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
