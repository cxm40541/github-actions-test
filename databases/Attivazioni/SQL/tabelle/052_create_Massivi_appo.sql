/****** Object:  Table [dbo].[Massivi_appo]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Massivi_appo](
	[ID] [int] NULL,
	[S] [bit] NOT NULL,
	[DataAperturaGuastoAlFornitore] [datetime] NULL,
	[OraAperturaGuastoAlFornitore] [datetime] NULL,
	[SITO] [nvarchar](50) NULL,
	[SERVIZIO] [nvarchar](50) NULL,
	[DESCRIZIONE GUASTO] [ntext] NULL,
	[IMPATTO GUASTO (Bloccante/non Bloccante/degrado)] [nvarchar](50) NULL,
	[APPARATO] [nvarchar](50) NULL,
	[LINEA FONIA ALBACOM] [nvarchar](50) NULL,
	[PROATTIVITA'] [nvarchar](50) NULL,
	[Data Inizio Guasto Tecnico] [datetime] NULL,
	[Ora Inizio Guasto Tecnico] [datetime] NULL,
	[Data Fine Guasto Tecnico] [datetime] NULL,
	[Ora Fine Guasto Tecnico] [datetime] NULL,
	[DataPropostaChiusuraGuastoDaParteDelFornitore] [datetime] NULL,
	[OraPropostaChiusuraGuastoDaParteDelFornitore] [datetime] NULL,
	[DataChiusuraFormaleGuasto] [datetime] NULL,
	[OraChiusuraFormaleGuasto] [datetime] NULL,
	[STATO] [nvarchar](1) NULL,
	[Causa/modalità risoluzione guasto] [ntext] NULL,
	[Note] [ntext] NULL,
	[DataSospensione] [datetime] NULL,
	[OraSospensione] [datetime] NULL,
	[FORNITORE] [nvarchar](50) NULL,
	[attività] [nvarchar](50) NULL,
	[matricola tecnico] [nvarchar](50) NULL,
	[terminali_coinvolti] [int] NULL
) ON [DATA] TEXTIMAGE_ON [DATA]
GO
