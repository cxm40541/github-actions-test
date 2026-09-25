/****** Object:  Table [dbo].[monitoraggio_delivery]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[monitoraggio_delivery](
	[id_soggetto] [char](6) NOT NULL,
	[postazione] [char](1) NOT NULL,
	[piano] [varchar](10) NOT NULL,
	[b_u] [char](20) NOT NULL,
	[tipo_linea] [varchar](20) NULL,
	[tipo_term] [char](4) NULL,
	[problematica] [char](5) NULL,
	[data_piano] [datetime] NULL,
	[data_ordine] [datetime] NULL,
	[data_prog_rete] [datetime] NULL,
	[data_rilascio] [datetime] NULL,
	[data_invio_verbale] [datetime] NULL,
	[data_off_line] [datetime] NULL,
	[data_attiv_term] [datetime] NULL,
	[data_in_gestione] [datetime] NULL,
	[data_aggiornamento] [datetime] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
