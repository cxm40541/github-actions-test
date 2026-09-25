/****** Object:  Table [dbo].[lsrfid_coni]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrfid_coni](
	[lsrfid_coni_key_id_ricev] [char](6) NOT NULL,
	[lsrfid_coni_key_data_ins] [char](8) NOT NULL,
	[lsrfid_coni_key_ora_ins] [char](8) NOT NULL,
	[lsrfid_coni_nome_file] [char](255) NULL,
	[lsrfid_coni_data_doc] [char](8) NULL,
	[lsrfid_coni_data_invio_doc] [char](8) NULL,
	[lsrfid_coni_num_prot_doc] [char](25) NULL,
	[lsrfid_coni_id_soc] [char](2) NULL,
	[lsrfid_coni_cognome] [char](24) NULL,
	[lsrfid_coni_nome] [char](20) NULL,
	[lsrfid_coni_importo] [numeric](18, 2) NULL,
	[lsrfid_coni_anno_rif] [char](4) NULL,
	[lsrfid_coni_note] [char](100) NULL,
	[lsrfid_coni_flag_anag] [char](1) NULL,
	[lsrfid_coni_fk_data_ins_tit] [char](8) NULL,
	[lsrfid_coni_fk_ora_ins_tit] [char](8) NULL,
	[lsrfid_coni_firma] [char](17) NULL,
 CONSTRAINT [PK_lsrfid_coni] PRIMARY KEY NONCLUSTERED 
(
	[lsrfid_coni_key_id_ricev] ASC,
	[lsrfid_coni_key_data_ins] ASC,
	[lsrfid_coni_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
