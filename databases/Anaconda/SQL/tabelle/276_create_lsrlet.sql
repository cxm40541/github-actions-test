/****** Object:  Table [dbo].[lsrlet]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrlet](
	[lsrlet_key_id_ricev] [char](6) NOT NULL,
	[lsrlet_key_data_ins] [char](8) NOT NULL,
	[lsrlet_key_ora_ins] [char](8) NOT NULL,
	[lsrlet_cod_servizio] [char](2) NULL,
	[lsrlet_tipo_movimentazione] [char](1) NULL,
	[lsrlet_decor_dal] [char](8) NULL,
	[lsrlet_nome_tab_documento] [char](15) NOT NULL,
	[lsrlet_fk_tab_documento] [char](16) NULL,
	[lsrlet_data_lettera] [char](8) NULL,
	[lsrlet_note] [char](255) NULL,
	[lsrlet_firma] [char](17) NULL,
	[lsrlet_tipo_ricev] [char](1) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IDX_lsrlet1] ON [dbo].[lsrlet] 
(
	[lsrlet_key_data_ins] ASC,
	[lsrlet_cod_servizio] ASC,
	[lsrlet_decor_dal] ASC,
	[lsrlet_data_lettera] ASC,
	[lsrlet_key_id_ricev] ASC,
	[lsrlet_tipo_movimentazione] ASC,
	[lsrlet_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
GO
