/****** Object:  Table [dbo].[S2T_POSService_scartati]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[S2T_POSService_scartati](
	[data_riferimento] [varchar](8) NOT NULL,
	[versione] [smallint] NOT NULL,
	[data_invio] [datetime] NOT NULL,
	[esito] [smallint] NOT NULL,
	[codice_sap_pos] [char](10) NOT NULL,
	[data_attivazione] [char](8) NULL,
	[stato_pos] [char](11) NULL,
	[descrizione_stato_pos] [char](50) NULL,
	[azione] [char](1) NULL,
 CONSTRAINT [PK_S2T_POSService_scartati] PRIMARY KEY CLUSTERED 
(
	[codice_sap_pos] ASC,
	[data_riferimento] ASC,
	[versione] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
