/****** Object:  Table [dbo].[lsrpro_coni]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrpro_coni](
	[lsrpro_coni_key_id_ricev] [char](6) NOT NULL,
	[lsrpro_coni_key_data_ins] [char](8) NOT NULL,
	[lsrpro_coni_key_ora_ins] [char](8) NOT NULL,
	[lsrpro_coni_tipo_provv] [char](1) NOT NULL,
	[lsrpro_coni_data_provv] [char](8) NOT NULL,
	[lsrpro_coni_prog_provv] [char](14) NOT NULL,
	[lsrpro_coni_decor_dal] [char](8) NULL,
	[lsrpro_coni_decor_al] [char](8) NULL,
	[lsrpro_coni_causale] [char](40) NULL,
	[lsrpro_coni_firma] [char](17) NULL,
	[lsrpro_coni_emanato] [char](25) NULL,
	[lsrpro_coni_fk_data_ins_tit] [char](8) NOT NULL,
	[lsrpro_coni_fk_ora_ins_tit] [char](8) NOT NULL,
	[lsrpro_coni_flag_validita] [char](1) NULL,
	[lsrpro_coni_ft_vos] [char](8) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
