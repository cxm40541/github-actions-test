/****** Object:  Table [dbo].[lsrfid_gp]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrfid_gp](
	[lsrfid_gp_key_id_ricev] [char](6) NOT NULL,
	[lsrfid_gp_key_data_ins] [char](8) NOT NULL,
	[lsrfid_gp_key_ora_ins] [char](8) NOT NULL,
	[lsrfid_gp_codice_servizio] [char](2) NOT NULL,
	[lsrfid_gp_nome_file] [char](255) NULL,
	[lsrfid_gp_data_doc] [char](8) NULL,
	[lsrfid_gp_data_invio_doc] [char](8) NULL,
	[lsrfid_gp_num_prot_doc] [char](25) NULL,
	[lsrfid_gp_id_soc] [char](2) NULL,
	[lsrfid_gp_cognome] [char](24) NULL,
	[lsrfid_gp_nome] [char](20) NULL,
	[lsrfid_gp_importo] [numeric](18, 2) NULL,
	[lsrfid_gp_anno_rif] [char](4) NULL,
	[lsrfid_gp_data_inizio] [char](8) NULL,
	[lsrfid_gp_data_fine] [char](8) NULL,
	[lsrfid_gp_note] [char](100) NULL,
	[lsrfid_gp_flag_anag] [char](1) NULL,
	[lsrfid_gp_fk_data_ins_tit] [char](8) NULL,
	[lsrfid_gp_fk_ora_ins_tit] [char](8) NULL,
	[lsrfid_gp_firma] [char](17) NULL,
 CONSTRAINT [PK_lsrfid_gp] PRIMARY KEY NONCLUSTERED 
(
	[lsrfid_gp_key_id_ricev] ASC,
	[lsrfid_gp_key_data_ins] ASC,
	[lsrfid_gp_key_ora_ins] ASC,
	[lsrfid_gp_codice_servizio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
