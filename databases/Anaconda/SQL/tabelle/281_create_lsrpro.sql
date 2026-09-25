/****** Object:  Table [dbo].[lsrpro]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrpro](
	[lsrpro_key_id_ricev] [char](6) NOT NULL,
	[lsrpro_key_tipo_rec] [char](1) NOT NULL,
	[lsrpro_data_ins] [char](8) NOT NULL,
	[lsrpro_ora_ins] [char](8) NOT NULL,
	[lsrpro_key_data_provv] [char](8) NOT NULL,
	[lsrpro_key_prog_provv] [char](14) NOT NULL,
	[lsrpro_causale] [char](40) NULL,
	[lsrpro_firma] [char](17) NOT NULL,
	[lsrpro_emanato] [char](25) NULL,
	[lsrpro_decor_dal] [char](8) NULL,
	[lsrpro_decor_al] [char](8) NULL,
	[lsrpro_tassa] [char](9) NULL,
	[lsrpro_anno] [char](4) NULL,
	[lsrpro_massimale] [char](11) NULL,
	[lsrpro_cod_tab] [char](10) NULL,
	[lsrpro_flag_annul] [char](1) NULL,
	[lsrpro_flag_validita] [char](1) NULL,
	[lsrpro_ft_vos] [char](8) NULL,
 CONSTRAINT [PK_lsrpro] PRIMARY KEY NONCLUSTERED 
(
	[lsrpro_key_id_ricev] ASC,
	[lsrpro_key_tipo_rec] ASC,
	[lsrpro_key_data_provv] ASC,
	[lsrpro_key_prog_provv] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
