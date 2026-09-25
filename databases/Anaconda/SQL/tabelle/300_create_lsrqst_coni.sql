/****** Object:  Table [dbo].[lsrqst_coni]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrqst_coni](
	[lsrqst_coni_key_id_ricev] [char](6) NOT NULL,
	[lsrqst_coni_key_data_ins] [char](8) NOT NULL,
	[lsrqst_coni_key_ora_ins] [char](8) NOT NULL,
	[lsrqst_coni_nome_file] [char](255) NULL,
	[lsrqst_coni_data_questionario] [char](8) NULL,
	[lsrqst_coni_data_invio] [char](8) NULL,
	[lsrqst_coni_num_prot] [char](25) NULL,
	[lsrqst_coni_cognome] [char](24) NULL,
	[lsrqst_coni_nome] [char](20) NULL,
	[lsrqst_coni_flag_sabato] [char](1) NULL,
	[lsrqst_coni_flag_domenica] [char](1) NULL,
	[lsrqst_coni_flag_collegamento] [char](1) NULL,
	[lsrqst_coni_num_term] [char](3) NULL,
	[lsrqst_coni_flag_anag] [char](1) NULL,
	[lsrqst_coni_fk_data_ins_tit] [char](8) NULL,
	[lsrqst_coni_fk_ora_ins_tit] [char](8) NULL,
	[lsrqst_coni_firma] [char](17) NULL,
 CONSTRAINT [PK_lsrqst_coni] PRIMARY KEY NONCLUSTERED 
(
	[lsrqst_coni_key_id_ricev] ASC,
	[lsrqst_coni_key_data_ins] ASC,
	[lsrqst_coni_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
