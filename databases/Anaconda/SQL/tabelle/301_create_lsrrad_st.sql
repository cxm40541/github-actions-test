/****** Object:  Table [dbo].[lsrrad_st]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrrad_st](
	[lsrrad_st_key_id_ricev] [char](6) NOT NULL,
	[lsrrad_st_key_data_ins] [char](8) NOT NULL,
	[lsrrad_st_key_ora_ins] [char](8) NOT NULL,
	[lsrrad_st_tipo_movimentazione] [char](1) NULL,
	[lsrrad_st_fonte] [char](1) NULL,
	[lsrrad_st_firma_doc] [char](17) NULL,
	[lsrrad_st_nome_file] [varchar](255) NULL,
	[lsrrad_st_data_decor] [char](8) NULL,
	[lsrrad_st_data_doc] [char](8) NULL,
	[lsrrad_st_data_invio_doc] [char](8) NULL,
	[lsrrad_st_num_prot_doc] [char](25) NULL,
	[lsrrad_st_cod_associazione] [char](1) NULL,
	[lsrrad_st_causale_lottomatica] [char](1) NULL,
	[lsrrad_st_stato] [char](1) NULL,
	[lsrrad_st_cognome] [char](24) NULL,
	[lsrrad_st_nome] [char](20) NULL,
	[lsrrad_st_note] [char](100) NULL,
	[lsrrad_st_flag_anag] [char](1) NULL,
	[lsrrad_st_fk_data_ins_tit] [char](8) NULL,
	[lsrrad_st_fk_ora_ins_tit] [char](8) NULL,
	[lsrrad_st_firma] [char](17) NULL,
 CONSTRAINT [PK_lsrrad_st] PRIMARY KEY CLUSTERED 
(
	[lsrrad_st_key_id_ricev] ASC,
	[lsrrad_st_key_data_ins] ASC,
	[lsrrad_st_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [INDEX]
GO
SET ANSI_PADDING OFF
GO
