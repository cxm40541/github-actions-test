/****** Object:  Table [dbo].[ADD_AUT_lsrcfs_pf_lis_STOR]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADD_AUT_lsrcfs_pf_lis_STOR](
	[lsrcfs_lis_key_id_ricev] [char](6) NOT NULL,
	[lsrcfs_lis_key_data_ins] [char](8) NOT NULL,
	[lsrcfs_lis_key_ora_ins] [char](8) NOT NULL,
	[lsrcfs_lis_data_inizio_val] [char](8) NOT NULL,
	[lsrcfs_lis_data_fine_val] [char](8) NOT NULL,
	[lsrcfs_lis_cod_fiscale] [char](16) NOT NULL,
	[lsrcfs_lis_cognome] [char](24) NOT NULL,
	[lsrcfs_lis_nome] [char](20) NOT NULL,
	[lsrcfs_lis_sesso] [char](1) NOT NULL,
	[lsrcfs_lis_data_nascita] [char](8) NOT NULL,
	[lsrcfs_lis_comune_nascita] [char](25) NOT NULL,
	[lsrcfs_lis_prov_nascita] [char](2) NOT NULL,
	[lsrcfs_lis_tipo_servizio] [char](2) NOT NULL,
	[lsrcfs_lis_data_elab] [char](8) NOT NULL,
	[lsrcfs_lis_scarto] [char](1) NOT NULL,
 CONSTRAINT [PK_ADD_AUT_lsrcfs_lis_STOR] PRIMARY KEY CLUSTERED 
(
	[lsrcfs_lis_key_id_ricev] ASC,
	[lsrcfs_lis_key_data_ins] ASC,
	[lsrcfs_lis_key_ora_ins] ASC,
	[lsrcfs_lis_tipo_servizio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
