/****** Object:  Table [dbo].[BonusLocale]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BonusLocale](
	[IdBonusLocale] [int] IDENTITY(1,1) NOT NULL,
	[Descrizione] [bit] NULL,
	[ParTipoBonusLocale] [int] NULL,
	[ParCalcoloBonusLocale] [int] NULL,
	[RientroForFisso] [float] NULL,
	[RientroForPerc] [float] NULL,
	[RientroHopFisso] [float] NULL,
	[RientroHopPerc] [float] NULL,
	[BO_LimiteBonifico] [varchar](10) NULL,
	[BO_AdiBonifico] [varchar](20) NULL,
	[BO_Tipo] [varchar](10) NULL,
	[RientroHopperTipo] [varchar](10) NULL,
	[RientroForTipo] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdBonusLocale] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
