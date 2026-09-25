/****** Object:  Table [dbo].[storico_attivita_pianificate]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[storico_attivita_pianificate](
	[ID_PIANO] [char](10) NOT NULL,
	[ID_SOGGETTO] [char](10) NOT NULL,
	[ID_ATTIVITA] [char](3) NOT NULL,
	[INIZIO] [datetime] NULL,
	[FINE] [datetime] NULL,
	[STATO] [char](1) NULL,
	[qta_app] [smallint] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
