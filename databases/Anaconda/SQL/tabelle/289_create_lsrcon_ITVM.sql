/****** Object:  Table [dbo].[lsrcon_ITVM]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrcon_ITVM](
	[lsrcon_ITVM_key_id_ricev] [char](7) NOT NULL,
	[lsrcon_ITVM_key_data_ins] [char](8) NOT NULL,
	[lsrcon_ITVM_key_ora_ins] [char](8) NOT NULL,
	[lsrcon_ITVM_cod_lotto] [char](6) NOT NULL,
	[lsrcon_ITVM_cod_amm] [char](6) NULL,
	[lsrcon_ITVM_tipo_acq] [char](1) NOT NULL,
	[lsrcon_ITVM_data_documento] [char](8) NULL,
	[lsrcon_ITVM_data_invio_doc] [char](8) NULL,
	[lsrcon_ITVM_num_prot_doc] [char](25) NOT NULL,
	[lsrcon_ITVM_cognome] [char](24) NULL,
	[lsrcon_ITVM_nome] [char](20) NULL,
	[lsrcon_ITVM_data_lettera] [char](8) NULL,
	[lsrcon_ITVM_num_macch] [int] NOT NULL,
	[lsrcon_ITVM_data_cessazione] [char](8) NULL,
	[lsrcon_ITVM_note] [char](100) NULL,
	[lsrcon_ITVM_flag_anag] [char](1) NOT NULL,
	[lsrcon_ITVM_fk_data_ins_tit] [char](8) NULL,
	[lsrcon_ITVM_fk_ora_ins_tit] [char](8) NULL,
	[lsrcon_ITVM_fk_data_ins_tit_gev] [char](8) NULL,
	[lsrcon_ITVM_fk_ora_ins_tit_gev] [char](8) NULL,
	[lsrcon_ITVM_firma] [char](17) NOT NULL,
 CONSTRAINT [PK_lsrcon_ITVM] PRIMARY KEY CLUSTERED 
(
	[lsrcon_ITVM_key_id_ricev] ASC,
	[lsrcon_ITVM_key_data_ins] ASC,
	[lsrcon_ITVM_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
