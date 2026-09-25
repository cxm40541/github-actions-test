/****** Object:  Table [dbo].[lsrrad_GS]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrrad_GS](
	[lsrrad_GS_key_id_ricev] [char](6) NOT NULL,
	[lsrrad_GS_key_data_ins] [char](8) NOT NULL,
	[lsrrad_GS_key_ora_ins] [char](8) NOT NULL,
	[lsrrad_GS_codice_servizio] [char](2) NOT NULL,
	[lsrrad_GS_tipo_movimentazione] [char](1) NULL,
	[lsrrad_GS_fonte] [char](1) NULL,
	[lsrrad_GS_firma_doc] [char](17) NULL,
	[lsrrad_GS_nome_file] [varchar](255) NULL,
	[lsrrad_GS_data_decor] [char](8) NULL,
	[lsrrad_GS_data_doc] [char](8) NULL,
	[lsrrad_GS_data_invio_doc] [char](8) NULL,
	[lsrrad_GS_num_prot_doc] [char](25) NULL,
	[lsrrad_GS_cod_associazione] [char](1) NULL,
	[lsrrad_GS_causale_lottomatica] [char](1) NULL,
	[lsrrad_GS_stato] [char](1) NULL,
	[lsrrad_GS_cognome] [char](24) NULL,
	[lsrrad_GS_nome] [char](20) NULL,
	[lsrrad_GS_note] [char](100) NULL,
	[lsrrad_GS_flag_anag] [char](1) NULL,
	[lsrrad_GS_fk_data_ins_tit] [char](8) NULL,
	[lsrrad_GS_fk_ora_ins_tit] [char](8) NULL,
	[lsrrad_GS_firma] [char](17) NULL,
 CONSTRAINT [PK_lsrrad_GS] PRIMARY KEY CLUSTERED 
(
	[lsrrad_GS_key_id_ricev] ASC,
	[lsrrad_GS_key_data_ins] ASC,
	[lsrrad_GS_key_ora_ins] ASC,
	[lsrrad_GS_codice_servizio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
