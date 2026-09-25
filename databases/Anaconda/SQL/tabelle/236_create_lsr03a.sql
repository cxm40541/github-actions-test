/****** Object:  Table [dbo].[lsr03a]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsr03a](
	[key_cod_lot] [char](6) NOT NULL,
	[tipo] [char](1) NOT NULL,
	[data_provv] [char](8) NULL,
	[prog_prov] [char](14) NULL,
	[causale] [char](40) NULL,
	[firma] [char](17) NULL,
	[emanato] [char](25) NULL,
	[decor_Dal] [char](8) NULL,
	[decor_al] [char](8) NULL,
	[tassa] [char](9) NULL,
	[anno] [char](4) NULL,
	[massimale] [char](11) NULL,
	[cod_tab] [char](10) NULL,
	[flag_annull] [char](1) NULL,
	[data_inserimento] [char](8) NULL,
	[data_annull] [char](8) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
