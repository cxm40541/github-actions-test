/****** Object:  Table [dbo].[lsr03a_conc]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsr03a_conc](
	[lsr03a_key_id_ricev] [char](6) NOT NULL,
	[lsr03a_key_tipo_rec] [char](1) NOT NULL,
	[lsr03a_key_data_provv] [char](8) NOT NULL,
	[lsr03a_key_prog_prov] [char](14) NOT NULL,
	[lsr03a_causale] [char](40) NULL,
	[lsr03a_firma] [char](17) NULL,
	[lsr03a_emanato] [char](25) NULL,
	[lsr03a_decor_dal] [char](8) NULL,
	[lsr03a_decor_al] [char](8) NULL,
	[lsr03a_tassa] [char](9) NULL,
	[lsr03a_anno] [char](4) NULL,
	[lsr03a_massimale] [char](11) NULL,
	[lsr03a_cod_tab] [char](10) NULL,
	[lsr03a_disponibile] [char](48) NULL,
	[lsr03a_flag_annull] [char](1) NULL,
	[lsr03a_data_ins] [char](8) NULL,
	[lsr03a_firma_annull] [char](17) NULL,
	[lsr03a_data_annull] [char](8) NULL,
	[lsr03a_filler] [char](7) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
