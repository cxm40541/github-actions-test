/****** Object:  Table [dbo].[lsrrad_Bollo]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrrad_Bollo](
	[lsrrad_Bollo_key_id_ricev] [char](6) NOT NULL,
	[lsrrad_Bollo_key_data_ins] [char](8) NOT NULL,
	[lsrrad_Bollo_key_ora_ins] [char](8) NOT NULL,
	[lsrrad_Bollo_cod_amm] [char](6) NULL,
	[lsrrad_Bollo_tipo_movimentazione] [char](1) NULL,
	[lsrrad_Bollo_fonte] [char](1) NULL,
	[lsrrad_Bollo_data_invio_doc] [char](8) NULL,
	[lsrrad_Bollo_num_prot_doc] [char](20) NULL,
	[lsrrad_Bollo_cod_associazione] [char](1) NULL,
	[lsrrad_Bollo_cod_ente] [char](2) NULL,
	[lsrrad_Bollo_causale_lottomatica] [char](1) NULL,
	[lsrrad_Bollo_cognome] [char](24) NULL,
	[lsrrad_Bollo_nome] [char](20) NULL,
	[lsrrad_Bollo_note] [char](100) NULL,
	[lsrrad_Bollo_flag_anag] [char](1) NULL,
	[lsrrad_Bollo_fk_data_ins_tit] [char](8) NULL,
	[lsrrad_Bollo_fk_ora_ins_tit] [char](8) NULL,
	[lsrrad_Bollo_firma] [char](17) NULL,
 CONSTRAINT [PK_lsrrad_Bollo] PRIMARY KEY NONCLUSTERED 
(
	[lsrrad_Bollo_key_id_ricev] ASC,
	[lsrrad_Bollo_key_data_ins] ASC,
	[lsrrad_Bollo_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
