/****** Object:  Table [dbo].[lsrrad_coni]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrrad_coni](
	[lsrrad_coni_key_id_ricev] [char](6) NOT NULL,
	[lsrrad_coni_key_data_ins] [char](8) NOT NULL,
	[lsrrad_coni_key_ora_ins] [char](8) NOT NULL,
	[lsrrad_coni_tipo_movimentazione] [char](1) NULL,
	[lsrrad_coni_fonte] [char](1) NULL,
	[lsrrad_coni_firma_doc] [char](17) NULL,
	[lsrrad_coni_nome_file] [varchar](255) NULL,
	[lsrrad_coni_data_decor] [char](8) NULL,
	[lsrrad_coni_data_doc] [char](8) NULL,
	[lsrrad_coni_data_invio_doc] [char](8) NULL,
	[lsrrad_coni_num_prot_doc] [char](25) NULL,
	[lsrrad_coni_cod_associazione] [char](1) NULL,
	[lsrrad_coni_causale_lottomatica] [char](1) NULL,
	[lsrrad_coni_stato] [char](1) NULL,
	[lsrrad_coni_cognome] [char](24) NULL,
	[lsrrad_coni_nome] [char](20) NULL,
	[lsrrad_coni_note] [char](100) NULL,
	[lsrrad_coni_flag_anag] [char](1) NULL,
	[lsrrad_coni_fk_data_ins_tit] [char](8) NULL,
	[lsrrad_coni_fk_ora_ins_tit] [char](8) NULL,
	[lsrrad_coni_firma] [char](17) NULL,
 CONSTRAINT [PK_lsrrad_coni] PRIMARY KEY CLUSTERED 
(
	[lsrrad_coni_key_id_ricev] ASC,
	[lsrrad_coni_key_data_ins] ASC,
	[lsrrad_coni_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [INDEX]
GO
SET ANSI_PADDING OFF
GO
