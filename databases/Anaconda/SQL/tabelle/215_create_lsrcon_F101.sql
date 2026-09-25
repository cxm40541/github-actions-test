/****** Object:  Table [dbo].[lsrcon_F101]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrcon_F101](
	[lsrcon_F101_key_id_ricev] [char](6) NOT NULL,
	[lsrcon_F101_key_data_ins] [char](8) NOT NULL,
	[lsrcon_F101_key_ora_ins] [char](8) NOT NULL,
	[lsrcon_F101_cod_amm] [char](6) NULL,
	[lsrcon_F101_tipo_doc] [char](1) NULL,
	[lsrcon_F101_data_contratto] [char](8) NULL,
	[lsrcon_F101_data_invio_doc] [char](8) NULL,
	[lsrcon_F101_num_prot_doc] [char](25) NULL,
	[lsrcon_F101_associazione] [char](1) NULL,
	[lsrcon_F101_stato_doc] [char](1) NULL,
	[lsrcon_F101_cognome] [char](24) NULL,
	[lsrcon_F101_nome] [char](20) NULL,
	[lsrcon_F101_note] [char](100) NULL,
	[lsrcon_F101_flag_anag] [char](1) NULL,
	[lsrcon_F101_fk_data_ins_tit] [char](8) NULL,
	[lsrcon_F101_fk_ora_ins_tit] [char](8) NULL,
	[lsrcon_F101_firma] [char](17) NULL,
 CONSTRAINT [PK_lsrcon_F101] PRIMARY KEY NONCLUSTERED 
(
	[lsrcon_F101_key_id_ricev] ASC,
	[lsrcon_F101_key_data_ins] ASC,
	[lsrcon_F101_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
