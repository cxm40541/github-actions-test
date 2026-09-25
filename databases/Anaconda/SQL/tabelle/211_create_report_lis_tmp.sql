/****** Object:  Table [dbo].[report_lis_tmp]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[report_lis_tmp](
	[cod_lottomatica] [char](6) NULL,
	[cod_amm] [char](6) NULL,
	[nome_servizio] [char](30) NULL,
	[denominazione] [char](50) NULL,
	[cognome] [char](24) NULL,
	[nome] [char](20) NULL,
	[data_decorr] [char](8) NULL,
	[stato] [char](1) NULL,
	[movimentazione] [char](1) NULL,
	[causale] [char](100) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
