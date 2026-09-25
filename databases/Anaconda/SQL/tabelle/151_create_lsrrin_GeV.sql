/****** Object:  Table [dbo].[lsrrin_GeV]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrrin_GeV](
	[lsrrin_GeV_key_id_ricev] [char](6) NOT NULL,
	[lsrrin_GeV_key_data_ins] [char](8) NOT NULL,
	[lsrrin_GeV_key_ora_ins] [char](8) NOT NULL,
	[lsrrin_GeV_cod_lotto] [char](6) NULL,
	[lsrrin_GeV_cod_amm] [char](6) NULL,
	[lsrrin_GeV_tipo_acq] [char](1) NULL,
	[lsrrin_GeV_data_documento] [char](8) NULL,
	[lsrrin_GeV_data_invio_doc] [char](8) NULL,
	[lsrrin_GeV_num_prot_doc] [char](20) NULL,
	[lsrrin_GeV_associazione] [varchar](2) NULL,
	[lsrrin_GeV_cognome] [char](24) NULL,
	[lsrrin_GeV_nome] [char](20) NULL,
	[lsrrin_GeV_data_rin] [char](8) NULL,
	[lsrrin_GeV_data_rin_rin] [char](8) NULL,
	[lsrrin_GeV_note] [char](100) NULL,
	[lsrrin_GeV_flag_anag] [char](1) NULL,
	[lsrrin_GeV_fk_data_ins_tit] [char](8) NULL,
	[lsrrin_GeV_fk_ora_ins_tit] [char](8) NULL,
	[lsrrin_GeV_fk_data_ins_tit_GeV] [char](8) NULL,
	[lsrrin_GeV_fk_ora_ins_tit_GeV] [char](8) NULL,
	[lsrrin_GeV_firma] [char](17) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
