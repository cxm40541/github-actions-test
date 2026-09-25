/****** Object:  Table [dbo].[lcg02a]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lcg02a](
	[terminale] [char](7) NOT NULL,
	[data_contabile] [datetime] NULL,
	[numero_annullate] [int] NULL,
	[numero_giocate] [int] NULL,
	[importo_annullate] [decimal](10, 2) NOT NULL,
	[importo_giocate] [decimal](10, 2) NULL,
	[coll007] [char](5) NULL,
	[coll008] [char](5) NULL,
	[matricola] [char](11) NULL,
	[coll010] [char](6) NULL,
	[data_concorso] [datetime] NULL,
	[data_ora_ultima_giocata] [datetime] NULL,
	[Col013] [char](5) NULL,
	[Col014] [char](5) NULL,
	[Col015] [char](11) NULL,
	[Col016] [char](11) NULL,
	[Col017] [char](4) NULL,
	[Col018] [char](1) NULL,
	[Col019] [char](8) NULL,
	[Col020] [char](2) NULL,
	[Col021] [char](5) NULL,
	[Col022] [char](2) NULL,
	[Col023] [char](4) NULL,
	[Col024] [char](6) NULL,
	[Col025] [char](4) NULL,
	[Col026] [char](6) NULL,
	[Col027] [char](1) NULL,
	[Col028] [char](1) NULL,
	[Col029] [char](8) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
