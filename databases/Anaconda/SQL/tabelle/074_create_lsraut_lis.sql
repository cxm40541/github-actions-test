/****** Object:  Table [dbo].[lsraut_lis]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsraut_lis](
	[lsraut_lis_key_id_ricev] [char](6) NOT NULL,
	[lsraut_lis_key_data_ins] [char](8) NOT NULL,
	[lsraut_lis_key_ora_ins] [char](8) NOT NULL,
	[lsraut_lis_key_categoria] [char](2) NOT NULL,
	[lsraut_lis_key_servizio] [char](2) NOT NULL,
	[lsraut_lis_key_attivita] [char](2) NOT NULL,
	[lsraut_lis_nome_file] [char](255) NULL,
	[lsraut_lis_data_contratto] [char](8) NULL,
	[lsraut_lis_data_invio_doc] [char](8) NULL,
	[lsraut_lis_num_prot_doc] [char](25) NULL,
	[lsraut_lis_associazione] [char](1) NULL,
	[lsraut_lis_stato_doc] [char](1) NULL,
	[lsraut_lis_cognome] [char](24) NULL,
	[lsraut_lis_nome] [char](20) NULL,
	[lsraut_lis_note] [char](100) NULL,
	[lsraut_lis_flag_anag] [char](1) NULL,
	[lsraut_lis_fk_data_ins_tit] [char](8) NULL,
	[lsraut_lis_fk_ora_ins_tit] [char](8) NULL,
	[lsraut_lis_firma] [char](17) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
