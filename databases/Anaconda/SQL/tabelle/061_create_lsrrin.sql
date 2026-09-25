/****** Object:  Table [dbo].[lsrrin]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrrin](
	[lsrrin_key_id_ricev] [char](6) NOT NULL,
	[lsrrin_key_data_ins] [char](8) NOT NULL,
	[lsrrin_key_ora_ins] [char](8) NOT NULL,
	[lsrrin_codice_servizio] [char](2) NOT NULL,
	[lsrrin_nome_file] [varchar](255) NULL,
	[lsrrin_data_doc] [char](8) NULL,
	[lsrrin_data_invio_doc] [char](8) NULL,
	[lsrrin_num_prot_doc] [char](25) NULL,
	[lsrrin_data_rinuncia] [char](8) NULL,
	[lsrrin_data_rinuncia_rinuncia] [char](8) NULL,
	[lsrrin_cognome] [char](24) NULL,
	[lsrrin_nome] [char](20) NULL,
	[lsrrin_flag_anag] [char](1) NULL,
	[lsrrin_fk_data_ins_tit] [char](8) NULL,
	[lsrrin_fk_ora_ins_tit] [char](8) NULL,
	[lsrrin_firma] [char](17) NULL,
 CONSTRAINT [PK_lsrrin] PRIMARY KEY NONCLUSTERED 
(
	[lsrrin_key_id_ricev] ASC,
	[lsrrin_key_data_ins] ASC,
	[lsrrin_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
