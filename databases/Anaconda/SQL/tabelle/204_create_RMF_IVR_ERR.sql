/****** Object:  Table [dbo].[RMF_IVR_ERR]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RMF_IVR_ERR](
	[nome_file_originario] [varchar](250) NULL,
	[catena] [varchar](50) NULL,
	[data_header_inizio] [varchar](8) NULL,
	[data_header_fine] [varchar](8) NULL,
	[codice_pv] [varchar](50) NULL,
	[parametri] [varchar](500) NULL,
	[nome_file_rigenerato] [varchar](250) NULL,
	[data_rigenerazione] [varchar](8) NULL,
	[data_insert] [varchar](8) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
