/****** Object:  Table [dbo].[lsrtit]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrtit](
	[lsrtit_key_id_ricev] [char](6) NOT NULL,
	[lsrtit_key_data_ins] [char](8) NOT NULL,
	[lsrtit_key_ora_ins] [char](8) NOT NULL,
	[lsrtit_cod_servizio] [char](2) NULL,
	[lsrtit_cognome] [char](24) NULL,
	[lsrtit_nome] [char](20) NULL,
	[lsrtit_data_nascita] [char](8) NULL,
	[lsrtit_comune_nascita] [char](30) NULL,
	[lsrtit_provincia_nascita] [char](2) NULL,
	[lsrtit_telefono] [char](12) NULL,
	[lsrtit_tipo] [char](1) NULL,
	[lsrtit_partita_iva] [char](11) NULL,
	[lsrtit_codice_fiscale] [char](16) NULL,
	[lsrtit_associazione] [char](1) NULL,
	[lsrtit_sesso] [char](1) NULL,
	[lsrtit_firma] [char](17) NULL,
	[lsrtit_data_provv] [char](8) NULL,
	[lsrtit_prog_provv] [char](14) NULL,
	[lsrtit_tipo_provv] [char](1) NULL,
	[lsrtit_data_validita] [char](8) NULL,
	[lsrtit_ora_validita] [char](8) NULL,
	[lsrtit_flag_validita] [char](1) NULL,
	[lsrtit_ft_vos] [char](8) NULL,
 CONSTRAINT [PK_lsrtit] PRIMARY KEY CLUSTERED 
(
	[lsrtit_key_id_ricev] ASC,
	[lsrtit_key_data_ins] ASC,
	[lsrtit_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [INDEX]
GO
SET ANSI_PADDING OFF
GO
