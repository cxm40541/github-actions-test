/****** Object:  Table [dbo].[lsrtlp_st]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrtlp_st](
	[lsrtlp_st_key_id_ricev] [char](6) NOT NULL,
	[lsrtlp_st_key_data_ins] [char](8) NOT NULL,
	[lsrtlp_st_key_ora_ins] [char](8) NOT NULL,
	[lsrtlp_st_nome_file] [char](255) NULL,
	[lsrtlp_st_data_rilascio] [char](8) NULL,
	[lsrtlp_st_num_prot_doc] [char](25) NULL,
	[lsrtlp_st_cognome] [char](24) NULL,
	[lsrtlp_st_nome] [char](20) NULL,
	[lsrtlp_st_note] [varchar](100) NULL,
	[lsrtlp_st_flag_anag] [char](1) NULL,
	[lsrtlp_st_fk_data_ins_tit] [char](8) NULL,
	[lsrtlp_st_fk_ora_ins_tit] [char](8) NULL,
	[lsrtlp_st_firma] [char](17) NULL,
 CONSTRAINT [PK_lsrtlp_st] PRIMARY KEY NONCLUSTERED 
(
	[lsrtlp_st_key_id_ricev] ASC,
	[lsrtlp_st_key_data_ins] ASC,
	[lsrtlp_st_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
