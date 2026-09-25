/****** Object:  Table [dbo].[lsrfid_GeV]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrfid_GeV](
	[lsrfid_GeV_key_id_ricev] [char](7) NOT NULL,
	[lsrfid_GeV_key_data_ins] [char](8) NOT NULL,
	[lsrfid_GeV_key_ora_ins] [char](8) NOT NULL,
	[lsrfid_GeV_cod_lotto] [char](6) NULL,
	[lsrfid_GeV_tipo_acq] [char](2) NULL,
	[lsrfid_GeV_data_documento] [char](8) NULL,
	[lsrfid_GeV_data_invio_doc] [char](8) NULL,
	[lsrfid_GeV_num_prot_doc] [char](25) NULL,
	[lsrfid_GeV_id_soc] [char](2) NULL,
	[lsrfid_GeV_cognome] [char](24) NULL,
	[lsrfid_GeV_nome] [char](20) NULL,
	[lsrfid_GeV_importo_dovuto] [decimal](18, 2) NULL,
	[lsrfid_GeV_importo_pagato] [decimal](18, 2) NOT NULL,
	[lsrfid_GeV_anno_rif] [char](4) NULL,
	[lsrfid_GeV_data_inizio] [char](8) NULL,
	[lsrfid_GeV_data_fine] [char](8) NULL,
	[lsrfid_GeV_note] [char](100) NULL,
	[lsrfid_GeV_flag_anag] [char](1) NULL,
	[lsrfid_GeV_fk_data_ins_tit] [char](8) NULL,
	[lsrfid_GeV_fk_ora_ins_tit] [char](8) NULL,
	[lsrfid_GeV_fk_data_ins_tit_gev] [char](8) NULL,
	[lsrfid_GeV_fk_ora_ins_tit_gev] [char](8) NULL,
	[lsrfid_GeV_firma] [char](17) NULL,
 CONSTRAINT [PK_lsrfid_GeV] PRIMARY KEY NONCLUSTERED 
(
	[lsrfid_GeV_key_id_ricev] ASC,
	[lsrfid_GeV_key_data_ins] ASC,
	[lsrfid_GeV_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
