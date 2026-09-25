/****** Object:  Table [dbo].[CASH_LocaleBonus]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CASH_LocaleBonus](
	[IdBonus] [int] IDENTITY(1,1) NOT NULL,
	[LastUpdate] [smalldatetime] NULL,
	[FkUserLast] [int] NULL,
	[FkLocale] [int] NULL,
	[Attivo] [bit] NULL,
	[Periodo] [varchar](60) NULL,
	[Tipo] [varchar](10) NULL,
	[Ripartizione] [varchar](10) NULL,
	[MaxVolte] [int] NULL,
	[MaxImporto] [float] NULL,
	[MaxSingle] [float] NULL,
	[Intervallo] [int] NULL,
	[GiorniEsclusi] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdBonus] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
