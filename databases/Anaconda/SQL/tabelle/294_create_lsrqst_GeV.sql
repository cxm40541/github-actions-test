/****** Object:  Table [dbo].[lsrqst_GeV]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrqst_GeV](
	[lsrqst_GeV_key_id_ricev] [char](7) NOT NULL,
	[lsrqst_GeV_key_data_ins] [char](8) NOT NULL,
	[lsrqst_GeV_key_ora_ins] [char](8) NOT NULL,
	[lsrqst_GeV_cod_lotto] [char](6) NULL,
	[lsrqst_GeV_cod_amm] [char](6) NULL,
	[lsrqst_GeV_tipo_acq] [char](1) NULL,
	[lsrqst_GeV_data_documento] [char](8) NULL,
	[lsrqst_GeV_data_invio_doc] [char](8) NULL,
	[lsrqst_GeV_num_prot_doc] [char](25) NULL,
	[lsrqst_GeV_associazione] [char](1) NULL,
	[lsrqst_GeV_cognome] [char](24) NULL,
	[lsrqst_GeV_nome] [char](20) NULL,
	[lsrqst_GeV_tipo_esercizio] [varchar](20) NULL,
	[lsrqst_GeV_anno_inizio] [char](4) NULL,
	[lsrqst_GeV_orario] [char](30) NULL,
	[lsrqst_GeV_giorno_riposo] [char](1) NULL,
	[lsrqst_GeV_num_vetrine] [char](1) NULL,
	[lsrqst_GeV_superficie] [char](1) NULL,
	[lsrqst_GeV_insegna_esterna] [char](1) NULL,
	[lsrqst_GeV_spazio_cliente] [char](1) NULL,
	[lsrqst_GeV_spazio_espositivo] [char](1) NULL,
	[lsrqst_GeV_spazio_espositori] [char](1) NULL,
	[lsrqst_GeV_presenza_superenalotto] [char](1) NULL,
	[lsrqst_GeV_presenza_totocalcio] [char](1) NULL,
	[lsrqst_GeV_presenza_totip] [char](1) NULL,
	[lsrqst_GeV_presenza_tris] [char](1) NULL,
	[lsrqst_GeV_presenza_f101] [char](1) NULL,
	[lsrqst_GeV_presenza_gev] [char](1) NULL,
	[lsrqst_GeV_incasso_gev] [char](10) NULL,
	[lsrqst_GeV_pc] [char](1) NULL,
	[lsrqst_GeV_stampante] [char](1) NULL,
	[lsrqst_GeV_internet] [char](1) NULL,
	[lsrqst_GeV_ubicazione] [char](1) NULL,
	[lsrqst_GeV_vicino_a] [char](1) NULL,
	[lsrqst_GeV_tel_prinicipale] [char](12) NULL,
	[lsrqst_GeV_tel_alternativo] [char](12) NULL,
	[lsrqst_GeV_fax] [varchar](12) NULL,
	[lsrqst_GeV_e_mail] [varchar](50) NULL,
	[lsrqst_GeV_note] [char](100) NULL,
	[lsrqst_Gev_fk_data_ins_qst_new] [char](8) NULL,
	[lsrqst_Gev_fk_ora_ins_qst_new] [char](8) NULL,
	[lsrqst_GeV_flag_anag] [char](1) NULL,
	[lsrqst_GeV_fk_data_ins_tit] [char](8) NULL,
	[lsrqst_GeV_fk_ora_ins_tit] [char](8) NULL,
	[lsrqst_GeV_fk_data_ins_tit_gev] [char](8) NULL,
	[lsrqst_GeV_fk_ora_ins_tit_gev] [char](8) NULL,
	[lsrqst_GeV_firma] [char](17) NULL,
 CONSTRAINT [PK_lsrqst_GeV] PRIMARY KEY CLUSTERED 
(
	[lsrqst_GeV_key_id_ricev] ASC,
	[lsrqst_GeV_key_data_ins] ASC,
	[lsrqst_GeV_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
