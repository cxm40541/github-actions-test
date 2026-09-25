/****** Object:  Table [dbo].[lsrcon_lis]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrcon_lis](
	[lsrcon_lis_key_id_ricev] [char](6) NOT NULL,
	[lsrcon_lis_key_data_ins] [char](8) NOT NULL,
	[lsrcon_lis_key_ora_ins] [char](8) NOT NULL,
	[lsrcon_lis_nome_file] [char](255) NULL,
	[lsrcon_lis_data_contratto] [char](8) NULL,
	[lsrcon_lis_data_invio_doc] [char](8) NULL,
	[lsrcon_lis_num_prot_doc] [char](25) NULL,
	[lsrcon_lis_associazione] [char](1) NULL,
	[lsrcon_lis_stato_doc] [char](1) NULL,
	[lsrcon_lis_partita_iva] [char](11) NULL,
	[lsrcon_lis_cognome] [char](24) NULL,
	[lsrcon_lis_nome] [char](20) NULL,
	[lsrcon_lis_note] [char](100) NULL,
	[lsrcon_lis_flag_anag] [char](1) NULL,
	[lsrcon_lis_fk_data_ins_tit] [char](8) NULL,
	[lsrcon_lis_fk_ora_ins_tit] [char](8) NULL,
	[lsrcon_lis_firma] [char](17) NULL,
 CONSTRAINT [PK_lsrcon_lis] PRIMARY KEY CLUSTERED 
(
	[lsrcon_lis_key_id_ricev] ASC,
	[lsrcon_lis_key_data_ins] ASC,
	[lsrcon_lis_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
