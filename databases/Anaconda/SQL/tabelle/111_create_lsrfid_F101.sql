/****** Object:  Table [dbo].[lsrfid_F101]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrfid_F101](
	[lsrfid_F101_key_id_ricev] [char](6) NOT NULL,
	[lsrfid_F101_key_data_ins] [char](8) NOT NULL,
	[lsrfid_F101_key_ora_ins] [char](8) NOT NULL,
	[lsrfid_F101_cod_amm] [char](6) NULL,
	[lsrfid_F101_data_invio_doc] [char](8) NULL,
	[lsrfid_F101_num_prot_doc] [char](25) NULL,
	[lsrfid_F101_id_soc] [char](2) NULL,
	[lsrfid_F101_cognome] [char](24) NULL,
	[lsrfid_F101_nome] [char](20) NULL,
	[lsrfid_F101_importo] [numeric](18, 2) NULL,
	[lsrfid_F101_valuta] [char](1) NULL,
	[lsrfid_F101_anno_rif] [char](4) NULL,
	[lsrfid_F101_flag_anag] [char](1) NULL,
	[lsrfid_F101_fk_data_ins_tit] [char](8) NULL,
	[lsrfid_F101_fk_ora_ins_tit] [char](8) NULL,
	[lsrfid_F101_firma] [char](17) NULL,
 CONSTRAINT [PK_lsrfid_F101] PRIMARY KEY NONCLUSTERED 
(
	[lsrfid_F101_key_id_ricev] ASC,
	[lsrfid_F101_key_data_ins] ASC,
	[lsrfid_F101_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [idx_fusco] ON [dbo].[lsrfid_F101] 
(
	[lsrfid_F101_key_id_ricev] ASC,
	[lsrfid_F101_importo] ASC,
	[lsrfid_F101_anno_rif] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
GO
