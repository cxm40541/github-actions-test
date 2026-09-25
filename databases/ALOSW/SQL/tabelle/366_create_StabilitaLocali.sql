/****** Object:  Table [dbo].[StabilitaLocali]    Script Date: 11/17/2025 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StabilitaLocali](
	[IdStabilita] [int] IDENTITY(1,1) NOT NULL,
	[IdLocale] [int] NULL,
	[NomeLocale] [varchar](250) NULL,
	[Anno] [int] NULL,
	[AWP31_12] [int] NULL,
	[BaseImponibile] [float] NULL,
	[DovutoCalcolato] [float] NULL,
	[DovutoUfficiale] [float] NULL,
	[DovutoAttualizzato] [float] NULL,
	[PercRipartizione] [float] NULL,
	[Recuperato] [float] NULL,
	[TipoRecupero] [int] NULL,
	[AWPAttuali] [int] NULL,
	[DataCreazione] [smalldatetime] NULL,
	[DataUltimoAgg] [smalldatetime] NULL,
	[LimitaAccumulo] [bit] NULL,
	[PercDivisione] [float] NULL,
	[Note] [varchar](250) NULL,
	[FkSospeso] [int] NULL,
	[swAttivo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdStabilita] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
