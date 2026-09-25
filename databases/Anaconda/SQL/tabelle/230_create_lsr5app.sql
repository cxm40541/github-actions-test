/****** Object:  Table [dbo].[lsr5app]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsr5app](
	[lsr5app_key_id_ricev] [char](6) NOT NULL,
	[lsr5app_key_tipo_rec] [char](1) NOT NULL,
	[lsr5app_key_data_provv] [char](8) NOT NULL,
	[lsr5app_key_prog_provv] [char](14) NOT NULL,
	[lsr5app_descrizione] [char](40) NULL,
	[lsr5app_firma] [char](17) NULL,
	[lsr5app_emanato] [char](25) NULL,
	[lsr5app_decor_dal] [char](8) NULL,
	[lsr5app_disponibile] [char](121) NULL,
	[lsr5app_flag_annull] [char](1) NULL,
	[lsr5app_data_ins] [char](8) NULL,
	[lsr5app_firma_annull] [char](17) NULL,
	[lsr5app_filler] [char](14) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
