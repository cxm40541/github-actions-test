/****** Object:  Table [dbo].[lsraps_GeV]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsraps_GeV](
	[lsraps_GeV_key_id_ricev] [char](6) NOT NULL,
	[lsraps_GeV_key_data_ins] [char](8) NOT NULL,
	[lsraps_GeV_key_ora_ins] [char](8) NOT NULL,
	[lsraps_GeV_cod_lotto] [char](6) NULL,
	[lsraps_GeV_tipo_acq] [char](2) NULL,
	[lsraps_GeV_data_documento] [char](8) NULL,
	[lsraps_GeV_data_invio_doc] [char](8) NULL,
	[lsraps_GeV_num_prot_doc] [char](25) NULL,
	[lsraps_GeV_modulo] [char](1) NULL,
	[lsraps_GeV_associazione] [char](1) NULL,
	[lsraps_GeV_cognome] [char](24) NULL,
	[lsraps_GeV_nome] [char](20) NULL,
	[lsraps_GeV_note] [char](100) NULL,
	[lsraps_GeV_flag_anag] [char](1) NULL,
	[lsraps_GeV_fk_data_ins_tit] [char](8) NULL,
	[lsraps_GeV_fk_ora_ins_tit] [char](8) NULL,
	[lsraps_GeV_fk_data_ins_tit_gev] [char](8) NULL,
	[lsraps_GeV_fk_ora_ins_tit_gev] [char](8) NULL,
	[lsraps_GeV_firma] [char](17) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
