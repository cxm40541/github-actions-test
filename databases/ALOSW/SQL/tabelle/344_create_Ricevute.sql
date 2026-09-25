/****** Object:  Table [dbo].[Ricevute]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ricevute](
	[IdRicevuta] [int] IDENTITY(1,1) NOT NULL,
	[Codice] [nvarchar](10) NULL,
	[Numero] [nvarchar](20) NULL,
	[CodiceLocale] [int] NULL,
	[Data] [smalldatetime] NULL,
	[Importo] [float] NULL,
	[Sconto] [float] NULL,
	[Totale] [float] NULL,
	[Pagato] [smallint] NULL,
	[Imponibile] [float] NULL,
	[Iva] [float] NULL,
	[AliquotaIVA] [int] NULL,
	[CodiceDitta] [int] NULL,
	[DataDa] [smalldatetime] NULL,
	[DataA] [smalldatetime] NULL,
	[Controfirmata] [bit] NOT NULL,
	[NumAssegno] [nvarchar](30) NULL,
	[Banca] [nvarchar](50) NULL,
	[Filiale] [nvarchar](50) NULL,
	[InAcconto] [bit] NOT NULL,
	[Comma] [nvarchar](1) NULL,
	[Tasse] [float] NULL,
	[AAMS] [float] NULL,
	[Rete] [float] NULL,
	[swExp] [bit] NULL
) ON [DATA]
GO
