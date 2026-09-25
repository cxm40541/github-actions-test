/****** Object:  Table [dbo].[cOperazione]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cOperazione](
	[IdOperazione] [int] IDENTITY(1,1) NOT NULL,
	[Data] [smalldatetime] NULL,
	[DataScadenza] [smalldatetime] NULL,
	[ParCausale] [int] NULL,
	[ParModalita] [int] NULL,
	[Beneficiario] [varchar](255) NULL,
	[Descrizione] [varchar](255) NULL,
	[Estremi] [varchar](255) NULL,
	[Entrata] [float] NULL,
	[Uscita] [float] NULL,
	[IdSocieta] [int] NULL,
	[ChkManual] [bit] NULL,
	[DataFattura] [smalldatetime] NULL,
	[ParCentroDiCosto] [int] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
