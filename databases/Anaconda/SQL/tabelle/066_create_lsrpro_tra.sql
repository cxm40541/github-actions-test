/****** Object:  Table [dbo].[lsrpro_tra]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrpro_tra](
	[lsrpro_tra_key_id_ricev] [char](6) NOT NULL,
	[lsrpro_tra_key_tipo_rec] [char](1) NOT NULL,
	[lsrpro_tra_data_ins] [char](8) NOT NULL,
	[lsrpro_tra_ora_ins] [char](8) NOT NULL,
	[lsrpro_tra_key_data_provv] [char](8) NOT NULL,
	[lsrpro_tra_key_prog_provv] [char](14) NOT NULL,
	[lsrpro_tra_inizio_decor_provv] [char](8) NULL,
	[lsrpro_tra_causale] [char](40) NULL,
	[lsrpro_tra_firma] [char](17) NOT NULL,
	[lsrpro_tra_decor_dal] [char](8) NOT NULL,
	[lsrpro_tra_decor_al] [char](8) NULL,
	[lsrpro_tra_data_scad_trasf] [char](8) NULL,
	[lsrpro_tra_indirizzo] [char](40) NULL,
	[lsrpro_tra_comune] [char](24) NULL,
	[lsrpro_tra_cap] [char](5) NULL,
	[lsrpro_tra_provincia] [char](2) NULL,
	[lsrpro_tra_note] [varchar](255) NULL,
	[lsrpro_tra_cod_tab] [char](10) NULL,
	[lsrpro_tra_flag_annul] [char](1) NULL,
	[lsrpro_tra_flag_validita] [char](1) NULL,
	[lsrpro_tra_ft_vos] [char](8) NULL,
 CONSTRAINT [PK_lsrpro_tra] PRIMARY KEY CLUSTERED 
(
	[lsrpro_tra_key_id_ricev] ASC,
	[lsrpro_tra_key_tipo_rec] ASC,
	[lsrpro_tra_key_data_provv] ASC,
	[lsrpro_tra_key_prog_provv] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
