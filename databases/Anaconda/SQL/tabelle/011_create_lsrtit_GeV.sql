/****** Object:  Table [dbo].[lsrtit_GeV]    Script Date: 11/17/2025 15:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrtit_GeV](
	[lsrtit_GeV_key_id_ricev] [char](6) NOT NULL,
	[lsrtit_GeV_key_data_ins] [char](8) NOT NULL,
	[lsrtit_GeV_key_ora_ins] [char](8) NOT NULL,
	[lsrtit_GeV_cognome] [char](24) NULL,
	[lsrtit_GeV_nome] [char](20) NULL,
	[lsrtit_GeV_data_nascita] [char](8) NULL,
	[lsrtit_GeV_comune_nascita] [char](25) NULL,
	[lsrtit_GeV_provincia_nascita] [char](2) NULL,
	[lsrtit_GeV_telefono] [char](12) NULL,
	[lsrtit_GeV_tipo] [char](1) NULL,
	[lsrtit_GeV_partita_iva] [char](11) NULL,
	[lsrtit_GeV_codice_fiscale] [char](16) NULL,
	[lsrtit_GeV_associazione] [char](1) NULL,
	[lsrtit_GeV_sesso] [char](1) NULL,
	[lsrtit_GeV_firma] [char](17) NULL,
	[lsrtit_GeV_data_provv] [char](8) NULL,
	[lsrtit_GeV_prog_provv] [char](14) NULL,
	[lsrtit_GeV_tipo_provv] [char](1) NULL,
	[lsrtit_GeV_data_validita] [char](8) NULL,
	[lsrtit_GeV_ora_validita] [char](8) NULL,
	[lsrtit_GeV_flag_validita] [char](1) NULL,
	[lsrtit_GeV_ft_vos] [char](8) NULL,
 CONSTRAINT [PK_lsrtit_GeV] PRIMARY KEY NONCLUSTERED 
(
	[lsrtit_GeV_key_id_ricev] ASC,
	[lsrtit_GeV_key_data_ins] ASC,
	[lsrtit_GeV_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
