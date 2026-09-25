/****** Object:  Table [dbo].[S2T_POSService]    Script Date: 11/17/2025 15:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[S2T_POSService](
	[codice_sap_pos] [char](10) NOT NULL,
	[def_codice_servizio] [char](9) NOT NULL,
	[def_societa_riferimento] [char](4) NOT NULL,
	[def_codice_contratto] [char](10) NOT NULL,
	[def_codice_configurazione] [char](5) NULL,
	[data_attivazione] [char](8) NULL,
	[stato_pos] [char](11) NULL,
	[descrizione_stato_pos] [char](50) NULL,
	[azione] [char](1) NULL,
 CONSTRAINT [PK_S2T_POSService] PRIMARY KEY CLUSTERED 
(
	[codice_sap_pos] ASC,
	[def_codice_servizio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
