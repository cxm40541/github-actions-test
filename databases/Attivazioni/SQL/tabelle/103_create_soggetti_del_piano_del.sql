/****** Object:  Table [dbo].[soggetti_del_piano_del]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[soggetti_del_piano_del](
	[ID_PIANO] [char](10) NOT NULL,
	[ID_SOGGETTO] [char](10) NOT NULL,
	[FLAG] [char](2) NULL,
	[COD_AMM] [char](10) NULL,
	[flag_cez] [char](2) NULL,
	[lavorato_cez] [char](5) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
