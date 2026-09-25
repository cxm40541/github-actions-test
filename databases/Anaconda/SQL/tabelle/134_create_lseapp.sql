/****** Object:  Table [dbo].[lseapp]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lseapp](
	[lseapp_key_id_ricev] [char](6) NOT NULL,
	[lseapp_key_tipo_rec] [char](1) NOT NULL,
	[lseapp_luogo_nasc] [char](30) NULL,
	[lseapp_prov_nasc] [char](2) NULL,
	[lseapp_data_nasc] [char](8) NULL,
	[lseapp_sesso] [char](1) NULL,
	[lseapp_cod_fisc] [char](16) NULL,
	[lseapp_cognome] [char](25) NULL,
	[lseapp_nome] [char](20) NULL,
	[lseapp_disponibile] [char](18) NULL,
	[lseapp_data_validita] [char](8) NULL,
	[lseapp_data_mod] [char](8) NULL,
	[lseapp_flag_esercizio] [char](1) NULL,
	[lseapp_filler] [char](6) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
