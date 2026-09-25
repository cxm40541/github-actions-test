/****** Object:  Table [dbo].[S2T_PointOfSale]    Script Date: 11/17/2025 15:18:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[S2T_PointOfSale](
	[codice_sap_pos] [char](10) NOT NULL,
	[codice_sap_cliente] [char](10) NULL,
	[codice_zucchetti_pos] [char](5) NULL,
	[codice_sinai_pos] [char](10) NULL,
	[codice_sgi] [char](7) NULL,
	[def_codice_stabilimento] [char](5) NULL,
	[insegna] [char](35) NULL,
	[indirizzo] [char](35) NULL,
	[localita] [char](30) NULL,
	[cap] [char](5) NULL,
	[provincia] [char](2) NULL,
	[telefono] [char](16) NULL,
	[def_fax] [char](16) NULL,
	[def_email] [char](256) NULL,
	[def_codice_configurazione] [char](5) NULL,
	[def_riga1] [char](24) NULL,
	[def_riga2] [char](24) NULL,
	[def_riga3] [char](24) NULL,
	[def_riga4] [char](24) NULL,
	[azione] [char](1) NULL,
 CONSTRAINT [PK_S2T_PointOfSale] PRIMARY KEY CLUSTERED 
(
	[codice_sap_pos] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
