/****** Object:  Table [dbo].[lsrchi_ft_vos]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrchi_ft_vos](
	[lsrchi_key_id_ricev] [char](6) NOT NULL,
	[lsrchi_key_id_ricev_ferie] [char](6) NOT NULL,
	[lsrchi_key_data_inizio] [char](8) NOT NULL,
	[lsrchi_data_fine] [char](8) NULL,
	[lsrchi_data_ins] [char](8) NULL,
	[lsrchi_firma] [char](17) NULL,
	[lsrchi_causale] [char](2) NULL,
	[lsrchi_uff_ente] [char](2) NULL,
	[lsrchi_uff_sigla_prov] [char](2) NULL,
	[lsrchi_uff_prog_prov] [char](1) NULL,
	[lsrchi_ora_ins] [char](8) NULL,
	[lsrchi_tipo_movimentazione] [char](1) NULL,
	[lsrchi_millennio] [char](1) NULL,
	[lsrchi_id_ricev] [char](6) NULL,
	[lsrchi_id_ricev_ferie] [char](6) NULL,
	[lsrchi_data_inizio] [char](8) NULL,
	[lsrchi_ft_vos] [char](8) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
