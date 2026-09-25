/****** Object:  Table [dbo].[lsraps_Tris]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsraps_Tris](
	[lsraps_Tris_key_id_ricev] [char](6) NOT NULL,
	[lsraps_Tris_key_data_ins] [char](8) NOT NULL,
	[lsraps_Tris_key_ora_ins] [char](8) NOT NULL,
	[lsraps_Tris_cognome] [char](24) NULL,
	[lsraps_Tris_nome] [char](20) NULL,
	[lsraps_Tris_aut_ps] [char](1) NULL,
	[lsraps_Tris_note] [char](100) NULL,
	[lsraps_Tris_flag_cni] [char](1) NULL,
	[lsraps_Tris_flag_ltm] [char](1) NULL,
	[lsraps_Tris_flag_anag] [char](1) NULL,
	[lsraps_Tris_fk_data_ins_tit] [char](8) NULL,
	[lsraps_Tris_fk_ora_ins_tit] [char](8) NULL,
	[lsraps_Tris_firma] [char](17) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
