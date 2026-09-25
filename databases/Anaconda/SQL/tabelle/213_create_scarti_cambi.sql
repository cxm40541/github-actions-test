/****** Object:  Table [dbo].[scarti_cambi]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[scarti_cambi](
	[cod_lotto] [char](6) NOT NULL,
	[cod_amm] [char](6) NULL,
	[data_validita] [varchar](8) NOT NULL,
	[data_al] [char](8) NULL,
	[nome] [char](50) NULL,
	[indirizzo] [char](40) NULL,
	[cap] [char](5) NULL,
	[comune] [char](24) NULL,
	[prov] [char](2) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
