/****** Object:  Table [dbo].[lsrtit_coni]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrtit_coni](
	[lsrtit_coni_key_id_ricev] [char](6) NOT NULL,
	[lsrtit_coni_key_data_ins] [char](8) NOT NULL,
	[lsrtit_coni_key_ora_ins] [char](8) NOT NULL,
	[lsrtit_coni_tipo_rec] [char](1) NOT NULL,
	[lsrtit_coni_codice_coni] [char](15) NULL,
	[lsrtit_coni_cognome] [char](24) NULL,
	[lsrtit_coni_nome] [char](20) NULL,
	[lsrtit_coni_denominazione] [char](50) NULL,
	[lsrtit_coni_data_nascita] [char](8) NULL,
	[lsrtit_coni_comune_nascita] [char](24) NULL,
	[lsrtit_coni_provincia_nascita] [char](2) NULL,
	[lsrtit_coni_codice_fiscale_titolare] [char](16) NULL,
	[lsrtit_coni_sesso] [char](1) NULL,
	[lsrtit_coni_indirizzo] [char](40) NULL,
	[lsrtit_coni_cap] [char](5) NULL,
	[lsrtit_coni_comune] [char](24) NULL,
	[lsrtit_coni_provincia] [char](2) NULL,
	[lsrtit_coni_partita_iva] [char](11) NULL,
	[lsrtit_coni_tel_casa] [char](12) NULL,
	[lsrtit_coni_tel_cell] [char](12) NULL,
	[lsrtit_coni_firma] [char](17) NULL,
	[lsrtit_coni_data_provv] [char](8) NULL,
	[lsrtit_coni_prog_provv] [char](14) NULL,
	[lsrtit_coni_tipo_provv] [char](1) NULL,
	[lsrtit_coni_data_validita] [char](8) NULL,
	[lsrtit_coni_ora_validita] [char](8) NULL,
	[lsrtit_coni_flag_validita] [char](1) NULL,
	[lsrtit_coni_flag_anag] [char](1) NULL,
	[lsrtit_coni_ft_vos] [char](8) NULL,
 CONSTRAINT [PK_lsrtit_coni] PRIMARY KEY CLUSTERED 
(
	[lsrtit_coni_key_id_ricev] ASC,
	[lsrtit_coni_key_data_ins] ASC,
	[lsrtit_coni_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [INDEX]
GO
SET ANSI_PADDING OFF
GO
