/****** Object:  Table [dbo].[lsrlet_lis]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrlet_lis](
	[lsrlet_lis_key_id_ricev] [char](6) NOT NULL,
	[lsrlet_lis_key_data_ins] [char](8) NOT NULL,
	[lsrlet_lis_key_ora_ins] [char](8) NOT NULL,
	[lsrlet_lis_key_categoria] [char](2) NOT NULL,
	[lsrlet_lis_key_servizio] [char](2) NOT NULL,
	[lsrlet_lis_key_attivita] [char](2) NOT NULL,
	[lsrlet_lis_tipo_movimentazione] [char](1) NULL,
	[lsrlet_lis_decor_dal] [char](8) NULL,
	[lsrlet_lis_nome_tab_documento] [char](15) NOT NULL,
	[lsrlet_lis_fk_tab_documento] [char](16) NULL,
	[lsrlet_lis_data_lettera] [char](8) NULL,
	[lsrlet_lis_note] [char](255) NULL,
	[lsrlet_lis_firma] [char](17) NULL,
	[lsrlet_lis_tipo_ricev] [char](1) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
