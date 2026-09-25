/****** Object:  Table [dbo].[lsrser_lis_report]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrser_lis_report](
	[cod_lottomatica] [char](6) NULL,
	[cod_amm] [char](6) NULL,
	[categoria] [char](2) NULL,
	[servizio] [char](2) NULL,
	[attivita] [char](2) NULL,
	[stato] [char](1) NULL,
	[data_decorr] [char](8) NULL,
	[causale] [char](2) NULL,
	[indirizzo] [char](40) NULL,
	[cap] [char](5) NULL,
	[comune] [char](24) NULL,
	[prov] [char](2) NULL,
	[piva] [char](11) NULL,
	[abi] [char](5) NULL,
	[cab] [char](5) NULL,
	[conto] [char](15) NULL,
	[cognome] [char](24) NULL,
	[nome] [char](20) NULL,
	[nome_servizio] [char](40) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
