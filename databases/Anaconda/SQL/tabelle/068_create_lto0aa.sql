/****** Object:  Table [dbo].[lto0aa]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lto0aa](
	[lto0aa_key_id_ricev] [char](6) NOT NULL,
	[lto0aa_key_data_fine_val] [char](8) NOT NULL,
	[lto0aa_data_inizio_val] [char](8) NULL,
	[lto0aa_key2_codice_banca] [char](6) NOT NULL,
	[lto0aa_tipo_giuridico] [char](1) NULL,
	[lto0aa_partita_iva] [char](11) NULL,
	[lto0aa_codice_fiscale] [char](16) NULL,
	[lto0aa_denominazione] [varchar](50) NULL,
	[lto0aa_cognome] [varchar](24) NULL,
	[lto0aa_nome] [varchar](20) NULL,
	[lto0aa_indirizzo] [varchar](40) NULL,
	[lto0aa_comune] [varchar](24) NULL,
	[lto0aa_cap] [char](5) NULL,
	[lto0aa_provincia] [char](2) NULL,
	[lto0aa_telefono_casa] [char](12) NULL,
	[lto0aa_telefono_cell] [char](12) NULL,
	[lto0aa_codice_coni] [char](6) NULL,
	[lto0aa_cod_amm] [char](6) NULL,
	[lto0aa_data_elab] [char](8) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
