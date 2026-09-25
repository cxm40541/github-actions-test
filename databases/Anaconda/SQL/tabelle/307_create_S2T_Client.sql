/****** Object:  Table [dbo].[S2T_Client]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[S2T_Client](
	[codice_sap_cliente] [char](10) NOT NULL,
	[codice_zucchetti_cliente] [char](5) NULL,
	[def_supercodice] [char](10) NULL,
	[codice_lotto] [char](6) NULL,
	[def_vbo] [char](23) NULL,
	[def_sia] [char](7) NULL,
	[partita_iva] [char](11) NULL,
	[codice_fiscale] [char](16) NULL,
	[def_societa_riferimento] [char](4) NULL,
	[ragione_sociale] [char](35) NULL,
	[def_forma_giuridica] [char](2) NULL,
	[indirizzo] [char](35) NULL,
	[localita] [char](30) NULL,
	[cap] [char](5) NULL,
	[provincia] [char](2) NULL,
	[telefono] [char](16) NULL,
	[def_fax] [char](16) NULL,
	[def_email] [char](256) NULL,
	[def_conto_merchant] [char](12) NULL,
	[codice_esterno] [char](21) NULL,
	[azione] [char](1) NULL,
 CONSTRAINT [PK_S2T_Client] PRIMARY KEY CLUSTERED 
(
	[codice_sap_cliente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
