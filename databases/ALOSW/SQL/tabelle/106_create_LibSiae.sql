/****** Object:  Table [dbo].[LibSiae]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibSiae](
	[IdLibretto] [int] IDENTITY(1,1) NOT NULL,
	[CodiceLibretto] [nvarchar](10) NULL,
	[IdLocale] [int] NULL,
	[Libretto] [nvarchar](20) NULL,
	[Reversale] [nvarchar](20) NULL,
	[CodiceLocale] [nvarchar](10) NULL,
	[Categoria] [int] NULL,
	[PrezzoPartita] [float] NULL,
	[NumeroGiocatori] [smallint] NULL,
	[DataInizio] [smalldatetime] NULL,
	[DataScad] [smalldatetime] NULL,
	[DataRata1] [smalldatetime] NULL,
	[Imponibile] [float] NULL,
	[NomeLocale] [nvarchar](80) NULL,
	[Attivo] [int] NULL,
	[DataCreazione] [smalldatetime] NULL,
	[DataFine] [smalldatetime] NULL,
	[Prop] [int] NULL,
	[Agente] [int] NULL,
	[Zona] [smallint] NULL
) ON [DATA]
GO
