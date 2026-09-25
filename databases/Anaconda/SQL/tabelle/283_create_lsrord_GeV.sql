/****** Object:  Table [dbo].[lsrord_GeV]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrord_GeV](
	[lsrord_GeV_key_id_ricev] [char](7) NOT NULL,
	[lsrord_GeV_key_data_ins] [char](8) NOT NULL,
	[lsrord_GeV_key_ora_ins] [char](8) NOT NULL,
	[lsrord_GeV_cod_lotto] [char](6) NULL,
	[lsrord_GeV_tipo_acq] [char](2) NULL,
	[lsrord_GeV_cognome] [char](24) NULL,
	[lsrord_GeV_nome] [char](20) NULL,
	[lsrord_GeV_key_id_gio] [char](4) NOT NULL,
	[lsrord_GeV_numero_pacchi] [char](3) NOT NULL,
	[lsrord_GeV_note] [char](100) NULL,
	[lsrord_GeV_flag_anag] [char](1) NULL,
	[lsrord_GeV_fk_data_ins_tit] [char](8) NULL,
	[lsrord_GeV_fk_ora_ins_tit] [char](8) NULL,
	[lsrord_GeV_fk_data_ins_tit_gev] [char](8) NULL,
	[lsrord_GeV_fk_ora_ins_tit_gev] [char](8) NULL,
	[lsrord_GeV_firma] [char](17) NULL,
 CONSTRAINT [PK_lsrord_GeV] PRIMARY KEY NONCLUSTERED 
(
	[lsrord_GeV_key_id_ricev] ASC,
	[lsrord_GeV_key_data_ins] ASC,
	[lsrord_GeV_key_ora_ins] ASC,
	[lsrord_GeV_key_id_gio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
