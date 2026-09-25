/****** Object:  Table [dbo].[lsr3app]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsr3app](
	[lsr3app_key_id_ricev] [char](6) NOT NULL,
	[lsr3app_key_tipo_rec] [char](1) NULL,
	[lsr3app_key_data_provv] [char](8) NULL,
	[lsr3app_key_prog_provv] [char](14) NULL,
	[lsr3app_causale] [char](40) NULL,
	[lsr3app_firma] [char](17) NULL,
	[lsr3app_emanato] [char](25) NULL,
	[lsr3app_decor_dal] [char](8) NULL,
	[lsr3app_decor_al] [char](8) NULL,
	[lsr3app_disponibile] [char](82) NULL,
	[lsr3app_flag_annull] [char](1) NULL,
	[lsr3app_data_ins] [char](8) NULL,
	[lsr3app_firma_annull] [char](17) NULL,
	[lsr3app_data_annull] [char](8) NULL,
	[lsr3app_filler] [char](7) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
