/****** Object:  Table [dbo].[lsrrin_coni]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrrin_coni](
	[lsrrin_coni_key_id_ricev] [char](6) NOT NULL,
	[lsrrin_coni_key_data_ins] [char](8) NOT NULL,
	[lsrrin_coni_key_ora_ins] [char](8) NOT NULL,
	[lsrrin_coni_codice_servizio] [char](2) NOT NULL,
	[lsrrin_coni_nome_file] [varchar](255) NULL,
	[lsrrin_coni_data_doc] [char](8) NULL,
	[lsrrin_coni_data_invio_doc] [char](8) NULL,
	[lsrrin_coni_num_prot_doc] [char](25) NULL,
	[lsrrin_coni_data_rinuncia] [char](8) NULL,
	[lsrrin_coni_data_rinuncia_rinuncia] [char](8) NULL,
	[lsrrin_coni_cognome] [char](24) NULL,
	[lsrrin_coni_nome] [char](20) NULL,
	[lsrrin_coni_flag_anag] [char](1) NULL,
	[lsrrin_coni_fk_data_ins_tit] [char](8) NULL,
	[lsrrin_coni_fk_ora_ins_tit] [char](8) NULL,
	[lsrrin_coni_firma] [char](17) NULL,
 CONSTRAINT [PK_lsrrin_coni] PRIMARY KEY NONCLUSTERED 
(
	[lsrrin_coni_key_id_ricev] ASC,
	[lsrrin_coni_key_data_ins] ASC,
	[lsrrin_coni_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
