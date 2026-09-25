/****** Object:  Table [dbo].[soggetti_in_gestione_del]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[soggetti_in_gestione_del](
	[ID_SOGGETTO] [char](10) NOT NULL,
	[DATA_TRASF] [datetime] NOT NULL,
	[DATA_IN_GIOCO] [datetime] NOT NULL,
	[ID_PIANO] [char](10) NOT NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
