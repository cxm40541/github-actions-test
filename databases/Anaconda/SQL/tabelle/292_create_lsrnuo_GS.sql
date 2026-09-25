/****** Object:  Table [dbo].[lsrnuo_GS]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrnuo_GS](
	[lsrnuo_GS_key_id_ricev] [char](6) NOT NULL,
	[lsrnuo_GS_key_data_ins] [char](8) NOT NULL,
	[lsrnuo_GS_key_ora_ins] [char](8) NOT NULL,
	[lsrnuo_GS_codice_servizio] [char](2) NOT NULL,
	[lsrnuo_GS_nome_file] [varchar](255) NULL,
	[lsrnuo_GS_data_nulla_osta] [char](8) NULL,
	[lsrnuo_GS_data_invio] [char](8) NULL,
	[lsrnuo_GS_num_prot] [char](25) NULL,
	[lsrnuo_GS_data_accettazione] [char](8) NULL,
	[lsrnuo_GS_data_revoca] [char](8) NULL,
	[lsrnuo_GS_stato] [char](1) NULL,
	[lsrnuo_GS_cognome] [char](24) NULL,
	[lsrnuo_GS_nome] [char](20) NULL,
	[lsrnuo_GS_num_conc_scommesse] [char](10) NULL,
	[lsrnuo_GS_data_conc_scommesse] [char](8) NULL,
	[lsrnuo_GS_num_autorizzazione] [char](10) NULL,
	[lsrnuo_GS_ril_autorizzazione] [char](20) NULL,
	[lsrnuo_GS_num_concessione] [char](6) NULL,
	[lsrnuo_GS_note] [varchar](100) NULL,
	[lsrnuo_GS_flag_anag] [char](1) NULL,
	[lsrnuo_GS_fk_data_ins_tit] [char](8) NULL,
	[lsrnuo_GS_fk_ora_ins_tit] [char](8) NULL,
	[lsrnuo_GS_firma] [char](17) NULL,
 CONSTRAINT [PK_lsrnuo_GS] PRIMARY KEY CLUSTERED 
(
	[lsrnuo_GS_key_id_ricev] ASC,
	[lsrnuo_GS_key_data_ins] ASC,
	[lsrnuo_GS_key_ora_ins] ASC,
	[lsrnuo_GS_codice_servizio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
