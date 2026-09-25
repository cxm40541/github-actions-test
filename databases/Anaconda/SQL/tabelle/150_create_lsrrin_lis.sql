/****** Object:  Table [dbo].[lsrrin_lis]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrrin_lis](
	[lsrrin_lis_key_id_ricev] [char](6) NOT NULL,
	[lsrrin_lis_key_data_ins] [char](8) NOT NULL,
	[lsrrin_lis_key_ora_ins] [char](8) NOT NULL,
	[lsrrin_lis_key_categoria] [char](2) NOT NULL,
	[lsrrin_lis_key_servizio] [char](2) NOT NULL,
	[lsrrin_lis_key_attivita] [char](2) NOT NULL,
	[lsrrin_lis_nome_file] [varchar](255) NULL,
	[lsrrin_lis_data_contratto] [char](8) NULL,
	[lsrrin_lis_data_invio_doc] [char](8) NULL,
	[lsrrin_lis_num_prot_doc] [char](25) NULL,
	[lsrrin_lis_data_rinuncia] [char](8) NULL,
	[lsrrin_lis_data_rinuncia_rinuncia] [char](8) NULL,
	[lsrrin_lis_associazione] [char](1) NULL,
	[lsrrin_lis_stato_doc] [char](1) NULL,
	[lsrrin_lis_cognome] [char](24) NULL,
	[lsrrin_lis_nome] [char](20) NULL,
	[lsrrin_lis_note] [varchar](50) NULL,
	[lsrrin_lis_flag_anag] [char](1) NULL,
	[lsrrin_lis_fk_data_ins_tit] [char](8) NULL,
	[lsrrin_lis_fk_ora_ins_tit] [char](8) NULL,
	[lsrrin_lis_firma] [char](17) NULL,
 CONSTRAINT [PK_lsrrin_lis] PRIMARY KEY NONCLUSTERED 
(
	[lsrrin_lis_key_id_ricev] ASC,
	[lsrrin_lis_key_data_ins] ASC,
	[lsrrin_lis_key_ora_ins] ASC,
	[lsrrin_lis_key_categoria] ASC,
	[lsrrin_lis_key_servizio] ASC,
	[lsrrin_lis_key_attivita] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
CREATE CLUSTERED INDEX [IX_lsrrin_lis] ON [dbo].[lsrrin_lis] 
(
	[lsrrin_lis_key_id_ricev] ASC,
	[lsrrin_lis_key_categoria] ASC,
	[lsrrin_lis_key_servizio] ASC,
	[lsrrin_lis_key_attivita] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
GO
