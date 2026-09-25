/****** Object:  Table [dbo].[Richiesta_gev]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Richiesta_gev](
	[cod_ltm] [char](6) NULL,
	[data_contr] [char](8) NULL,
	[stato_gev] [char](1) NULL,
	[stato_lotto] [char](2) NULL,
	[altri_giochi] [char](1) NULL,
	[orario] [varchar](50) NULL,
	[giorno_riposo] [varchar](50) NULL,
	[num_vetrine] [varchar](50) NULL,
	[superficie] [varchar](50) NULL,
	[insegna_esterna] [varchar](50) NULL,
	[spazio_cliente] [varchar](50) NULL,
	[spazio_espositivo] [varchar](50) NULL,
	[spazio_espositori] [varchar](50) NULL,
	[ubicazione] [varchar](50) NULL,
	[vicino_a] [varchar](50) NULL,
	[tipo_rivendita] [varchar](50) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
