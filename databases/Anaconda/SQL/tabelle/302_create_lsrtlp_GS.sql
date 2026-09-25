/****** Object:  Table [dbo].[lsrtlp_GS]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrtlp_GS](
	[lsrtlp_GS_key_id_ricev] [char](6) NOT NULL,
	[lsrtlp_GS_key_data_ins] [char](8) NOT NULL,
	[lsrtlp_GS_key_ora_ins] [char](8) NOT NULL,
	[lsrtlp_GS_codice_servizio] [char](2) NOT NULL,
	[lsrtlp_GS_nome_file] [char](255) NULL,
	[lsrtlp_GS_data_rilascio] [char](8) NULL,
	[lsrtlp_GS_num_prot_doc] [char](25) NULL,
	[lsrtlp_GS_cognome] [char](24) NULL,
	[lsrtlp_GS_nome] [char](20) NULL,
	[lsrtlp_GS_note] [varchar](100) NULL,
	[lsrtlp_GS_flag_anag] [char](1) NULL,
	[lsrtlp_GS_fk_data_ins_tit] [char](8) NULL,
	[lsrtlp_GS_fk_ora_ins_tit] [char](8) NULL,
	[lsrtlp_GS_firma] [char](17) NULL,
 CONSTRAINT [PK_lsrtlp_GS] PRIMARY KEY CLUSTERED 
(
	[lsrtlp_GS_key_id_ricev] ASC,
	[lsrtlp_GS_key_data_ins] ASC,
	[lsrtlp_GS_key_ora_ins] ASC,
	[lsrtlp_GS_codice_servizio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
