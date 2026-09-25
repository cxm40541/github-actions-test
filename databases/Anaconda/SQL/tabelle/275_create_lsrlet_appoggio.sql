/****** Object:  Table [dbo].[lsrlet_appoggio]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrlet_appoggio](
	[lsrlet_key_id_ricev] [char](6) NULL,
	[lsrlet_cod_amm] [char](10) NULL,
	[lsrlet_cognome] [char](24) NULL,
	[lsrlet_nome] [char](20) NULL,
	[lsrlet_cod_servizio] [char](2) NULL,
	[lsrlet_tipo_movimentazione] [char](1) NULL,
	[lsrlet_data_decor] [char](8) NULL,
	[lsrlet_num_prot_documento] [char](20) NULL,
	[lsrlet_data_prot_documento] [char](8) NULL,
	[lsrlet_destinatario] [char](2) NULL,
	[lsrlet_cod_destinatario] [char](2) NULL,
	[lsrlet_causale] [char](100) NULL,
	[lsrlet_data_ins] [char](8) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
