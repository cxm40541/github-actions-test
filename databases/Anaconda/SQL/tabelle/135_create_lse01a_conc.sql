/****** Object:  Table [dbo].[lse01a_conc]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lse01a_conc](
	[lse01a_key_id_ricev] [char](6) NOT NULL,
	[lse01a_key_tipo_rec] [char](1) NOT NULL,
	[lse01a_luogo_nasc] [char](30) NULL,
	[lse01a_prov_nasc] [char](2) NULL,
	[lse01a_data_nasc] [char](8) NULL,
	[lse01a_sesso] [char](1) NULL,
	[lse01a_cod_fisc] [char](16) NULL,
	[lse01a_cognome] [char](25) NULL,
	[lse01a_nome] [char](20) NULL,
	[lse01a_disponibile] [char](18) NULL,
	[lse01a_data_validita] [char](8) NULL,
	[lse01a_data_mod] [char](8) NULL,
	[lse01a_flag_esercizio] [char](1) NULL,
	[lse01a_filler] [char](6) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
