/****** Object:  Table [dbo].[lsrcon_GS]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrcon_GS](
	[lsrcon_GS_key_id_ricev] [char](6) NOT NULL,
	[lsrcon_GS_key_data_ins] [char](8) NOT NULL,
	[lsrcon_GS_key_ora_ins] [char](8) NOT NULL,
	[lsrcon_GS_codice_servizio] [char](2) NOT NULL,
	[lsrcon_GS_nome_file] [char](255) NULL,
	[lsrcon_GS_data_contratto] [char](8) NULL,
	[lsrcon_GS_data_invio_doc] [char](8) NULL,
	[lsrcon_GS_num_prot_doc] [char](25) NULL,
	[lsrcon_GS_cognome] [char](24) NULL,
	[lsrcon_GS_nome] [char](20) NULL,
	[lsrcon_GS_partita_iva] [char](11) NULL,
	[lsrcon_GS_codice_fiscale] [char](16) NULL,
	[lsrcon_GS_flag_anag] [char](1) NULL,
	[lsrcon_GS_fk_data_ins_tit] [char](8) NULL,
	[lsrcon_GS_fk_ora_ins_tit] [char](8) NULL,
	[lsrcon_GS_firma] [char](17) NULL,
 CONSTRAINT [PK_lsrcon_GS] PRIMARY KEY CLUSTERED 
(
	[lsrcon_GS_key_id_ricev] ASC,
	[lsrcon_GS_key_data_ins] ASC,
	[lsrcon_GS_key_ora_ins] ASC,
	[lsrcon_GS_codice_servizio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
