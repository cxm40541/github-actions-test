/****** Object:  Table [dbo].[pregresso_servizi_LIS]    Script Date: 11/17/2025 15:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pregresso_servizi_LIS](
	[cod_lottomatica] [varchar](6) NULL,
	[cod_servizio] [varchar](2) NULL,
	[data_attivazione] [varchar](8) NULL,
	[data_disattivazione] [varchar](8) NULL,
	[stato] [varchar](1) NULL,
	[data_elaborazione] [varchar](8) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
