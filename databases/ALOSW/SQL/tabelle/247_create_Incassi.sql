/****** Object:  Table [dbo].[Incassi]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Incassi](
	[IdIncasso] [int] IDENTITY(1,1) NOT NULL,
	[Codice] [nvarchar](10) NULL,
	[Data] [smalldatetime] NULL,
	[CodiceLocale] [int] NULL,
	[TipoOggetto] [smallint] NULL,
	[TipoIncasso] [smallint] NULL,
	[CodiceOggetto] [int] NULL,
	[Incasso] [float] NULL,
	[IncassoNetto] [float] NULL,
	[Ricevuta] [int] NULL,
	[Pagato] [smallint] NULL,
	[Contatore1] [float] NULL,
	[Contatore2] [float] NULL,
	[Contatore3] [float] NULL,
	[Contatore4] [float] NULL,
	[Carico] [int] NULL,
	[TipoMerce] [varchar](50) NULL,
	[BollettaIncasso] [int] NULL,
	[Trasferito] [int] NULL,
	[TotaleEntrate] [float] NULL,
	[TotaleUscite] [float] NULL,
	[Perc] [int] NULL,
	[CM] [tinyint] NULL,
	[MU] [tinyint] NULL,
	[DataPagamento] [smalldatetime] NULL,
	[IdSospeso] [int] NULL,
	[prop] [int] NULL,
	[agente] [int] NULL,
	[associato] [int] NULL,
	[Tasse] [float] NULL,
	[ParTipologiaMonopoli] [int] NULL,
	[aams] [float] NULL,
	[rete] [float] NULL,
	[CausaleSconto] [int] NULL,
	[Sezionale] [int] NULL,
 CONSTRAINT [PK_Incassi] PRIMARY KEY CLUSTERED 
(
	[IdIncasso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
