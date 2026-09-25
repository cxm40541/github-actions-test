/****** Object:  Table [dbo].[S2T_Client_inviati]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[S2T_Client_inviati](
	[data_riferimento] [varchar](8) NOT NULL,
	[versione] [smallint] NOT NULL,
	[data_invio] [datetime] NOT NULL,
	[esito] [smallint] NOT NULL,
	[codice_sap_cliente] [char](10) NOT NULL,
	[codice_zucchetti_cliente] [char](5) NULL,
	[codice_lotto] [char](6) NULL,
	[partita_iva] [char](11) NULL,
	[codice_fiscale] [char](16) NULL,
	[ragione_sociale] [char](35) NULL,
	[indirizzo] [char](35) NULL,
	[localita] [char](30) NULL,
	[cap] [char](5) NULL,
	[provincia] [char](2) NULL,
	[telefono] [char](16) NULL,
	[codice_esterno] [char](21) NULL,
	[azione] [char](1) NULL,
 CONSTRAINT [PK_S2T_Client_Inviati] PRIMARY KEY CLUSTERED 
(
	[data_riferimento] ASC,
	[versione] ASC,
	[codice_sap_cliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
