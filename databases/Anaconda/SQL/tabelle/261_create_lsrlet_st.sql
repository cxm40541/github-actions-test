/****** Object:  Table [dbo].[lsrlet_st]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrlet_st](
	[lsrlet_st_key_id_ricev] [char](6) NOT NULL,
	[lsrlet_st_key_data_ins] [char](8) NOT NULL,
	[lsrlet_st_key_ora_ins] [char](8) NOT NULL,
	[lsrlet_st_tipo_movimentazione] [char](1) NULL,
	[lsrlet_st_decor_dal] [char](8) NULL,
	[lsrlet_st_nome_tab_documento] [char](15) NOT NULL,
	[lsrlet_st_fk_tab_documento] [char](16) NULL,
	[lsrlet_st_data_lettera] [char](8) NULL,
	[lsrlet_st_note] [char](255) NULL,
	[lsrlet_st_firma] [char](17) NULL,
	[lsrlet_st_tipo_ricev] [char](1) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
