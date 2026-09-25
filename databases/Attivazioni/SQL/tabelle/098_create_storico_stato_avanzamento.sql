/****** Object:  Table [dbo].[storico_stato_avanzamento]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[storico_stato_avanzamento](
	[ID_PIANO] [char](10) NOT NULL,
	[ID_SOGGETTO] [char](10) NOT NULL,
	[PROGR_OPERAZIONE] [int] NOT NULL,
	[ID_ATTIVITA] [char](3) NOT NULL,
	[COD_AVANZAMENTO] [char](5) NULL,
	[INIZIO] [datetime] NOT NULL,
	[FINE] [datetime] NOT NULL,
	[ORA_INIZIO] [datetime] NULL,
	[ORA_FINE] [datetime] NULL,
	[NOTE] [varchar](255) NULL,
	[COD_APPAR] [char](10) NULL,
	[VERBALE_COLLAUDO] [char](1) NULL,
	[DATA_INT_VERB] [datetime] NULL,
	[VALIDATO] [char](1) NULL,
	[COD_MANCATO_INT] [smallint] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
