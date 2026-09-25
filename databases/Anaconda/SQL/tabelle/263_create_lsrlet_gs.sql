/****** Object:  Table [dbo].[lsrlet_gs]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrlet_gs](
	[lsrlet_gs_key_id_ricev] [char](6) NOT NULL,
	[lsrlet_gs_key_data_ins] [char](8) NOT NULL,
	[lsrlet_gs_key_ora_ins] [char](8) NOT NULL,
	[lsrlet_gs_key_codice_servizio] [char](2) NOT NULL,
	[lsrlet_gs_tipo_movimentazione] [char](1) NULL,
	[lsrlet_gs_decor_dal] [char](8) NULL,
	[lsrlet_gs_nome_tab_documento] [char](15) NOT NULL,
	[lsrlet_gs_fk_tab_documento] [char](16) NULL,
	[lsrlet_gs_data_lettera] [char](8) NULL,
	[lsrlet_gs_note] [char](255) NULL,
	[lsrlet_gs_firma] [char](17) NULL,
	[lsrlet_gs_tipo_ricev] [char](1) NULL,
 CONSTRAINT [PK_lsrlet_gs] PRIMARY KEY CLUSTERED 
(
	[lsrlet_gs_key_id_ricev] ASC,
	[lsrlet_gs_key_data_ins] ASC,
	[lsrlet_gs_key_ora_ins] ASC,
	[lsrlet_gs_key_codice_servizio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
