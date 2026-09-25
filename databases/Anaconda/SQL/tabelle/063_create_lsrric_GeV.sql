/****** Object:  Table [dbo].[lsrric_GeV]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrric_GeV](
	[lsrric_GeV_key_id_ricev] [char](6) NOT NULL,
	[lsrric_GeV_key_data_ins] [char](8) NOT NULL,
	[lsrric_GeV_key_ora_ins] [char](8) NOT NULL,
	[lsrric_GeV_num_term] [char](2) NULL,
	[lsrric_GeV_ext_id_ricev] [char](6) NULL,
	[lsrric_GeV_decod_ricev] [char](50) NULL,
	[lsrric_GeV_indirizzo] [char](40) NULL,
	[lsrric_GeV_comune_ricev] [char](24) NULL,
	[lsrric_GeV_prov_ricev] [char](2) NULL,
	[lsrric_GeV_cap] [char](5) NULL,
	[lsrric_GeV_tel_ricev] [char](12) NULL,
	[lsrric_GeV_cat_ricev] [char](4) NULL,
	[lsrric_GeV_rete_ricev] [char](1) NULL,
	[lsrric_GeV_tipo_ricev] [char](1) NULL,
	[lsrric_GeV_capo_tipo_ricev] [char](6) NULL,
	[lsrric_GeV_firma] [char](17) NULL,
	[lsrric_GeV_data_validita] [char](8) NULL,
	[lsrric_GeV_ora_validita] [char](8) NULL,
	[lsrric_GeV_flag_validita] [char](1) NULL,
	[lsrric_GeV_ft_vos] [char](8) NULL,
 CONSTRAINT [PK_lsrric_GeV] PRIMARY KEY NONCLUSTERED 
(
	[lsrric_GeV_key_id_ricev] ASC,
	[lsrric_GeV_key_data_ins] ASC,
	[lsrric_GeV_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
