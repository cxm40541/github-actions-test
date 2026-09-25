/****** Object:  Table [dbo].[lsrfid_Tris]    Script Date: 11/17/2025 15:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrfid_Tris](
	[lsrfid_Tris_key_id_ricev] [char](6) NOT NULL,
	[lsrfid_Tris_key_data_ins] [char](8) NOT NULL,
	[lsrfid_Tris_key_ora_ins] [char](8) NOT NULL,
	[lsrfid_Tris_id_soc] [char](2) NULL,
	[lsrfid_Tris_cognome] [char](24) NULL,
	[lsrfid_Tris_nome] [char](20) NULL,
	[lsrfid_tris_importo_dovuto] [char](9) NULL,
	[lsrfid_Tris_importo_pagato] [decimal](18, 2) NULL,
	[lsrfid_Tris_valuta] [char](1) NULL,
	[lsrfid_Tris_anno_rif] [char](4) NULL,
	[lsrfid_Tris_note] [char](100) NULL,
	[lsrfid_Tris_flag_cni] [char](1) NULL,
	[lsrfid_Tris_flag_ltm] [char](1) NULL,
	[lsrfid_Tris_flag_anag] [char](1) NULL,
	[lsrfid_Tris_fk_data_ins_tit] [char](8) NULL,
	[lsrfid_Tris_fk_ora_ins_tit] [char](8) NULL,
	[lsrfid_Tris_firma] [char](17) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
