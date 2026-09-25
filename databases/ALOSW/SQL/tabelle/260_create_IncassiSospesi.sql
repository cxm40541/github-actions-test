/****** Object:  Table [dbo].[IncassiSospesi]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncassiSospesi](
	[IdIncasso] [int] IDENTITY(1,1) NOT NULL,
	[CodiceLocale] [int] NULL,
	[CodiceOggetto] [int] NULL,
	[TipoOggetto] [int] NULL,
	[IdSocieta] [int] NULL,
	[IdAssociato] [int] NULL,
	[IdConcessionario] [int] NULL,
	[IdUser] [int] NULL,
	[Data] [smalldatetime] NULL,
	[CO1] [float] NULL,
	[CO2] [float] NULL,
	[CO3] [float] NULL,
	[CO4] [float] NULL,
	[CN1] [float] NULL,
	[CN2] [float] NULL,
	[CN3] [float] NULL,
	[CN4] [float] NULL,
	[P1] [float] NULL,
	[P2] [float] NULL,
	[P3] [float] NULL,
	[P4] [float] NULL,
	[TipoIncasso] [int] NULL,
	[Percentuale] [int] NULL,
	[PercPreu] [float] NULL,
	[PercAAMS] [float] NULL,
	[DataUltimoIncasso] [smalldatetime] NULL,
	[swProcessato] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdIncasso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
