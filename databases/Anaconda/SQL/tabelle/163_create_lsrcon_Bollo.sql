/****** Object:  Table [dbo].[lsrcon_Bollo]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrcon_Bollo](
	[lsrcon_Bollo_key_id_ricev] [char](6) NOT NULL,
	[lsrcon_Bollo_key_data_ins] [char](8) NOT NULL,
	[lsrcon_Bollo_key_ora_ins] [char](8) NOT NULL,
	[lsrcon_Bollo_cod_amm] [char](6) NULL,
	[lsrcon_Bollo_tipo_doc] [char](1) NULL,
	[lsrcon_Bollo_versione_doc] [char](1) NULL,
	[lsrcon_Bollo_data_contratto] [char](8) NULL,
	[lsrcon_Bollo_data_invio_doc] [char](8) NULL,
	[lsrcon_Bollo_num_prot_doc] [char](25) NULL,
	[lsrcon_Bollo_associazione] [char](1) NULL,
	[lsrcon_Bollo_stato_doc] [char](1) NULL,
	[lsrcon_Bollo_cognome] [char](24) NULL,
	[lsrcon_Bollo_nome] [char](20) NULL,
	[lsrcon_Bollo_note] [char](100) NULL,
	[lsrcon_Bollo_flag_anag] [char](1) NULL,
	[lsrcon_Bollo_fk_data_ins_tit] [char](8) NULL,
	[lsrcon_Bollo_fk_ora_ins_tit] [char](8) NULL,
	[lsrcon_Bollo_firma] [char](17) NULL,
 CONSTRAINT [PK_lsrcon_Bollo] PRIMARY KEY CLUSTERED 
(
	[lsrcon_Bollo_key_id_ricev] ASC,
	[lsrcon_Bollo_key_data_ins] ASC,
	[lsrcon_Bollo_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [INDEX]
GO
SET ANSI_PADDING OFF
GO
