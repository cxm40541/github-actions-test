/****** Object:  Table [dbo].[temporaneaAps]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[temporaneaAps](
	[id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[key_id_ricev] [char](6) NOT NULL,
	[key_servizio] [char](1) NOT NULL,
	[cod_amm] [char](6) NULL,
	[cognome_new] [char](24) NULL,
	[nome_new] [char](20) NULL,
	[stato] [char](1) NULL,
	[contratto] [char](1) NULL,
	[fidejussione] [char](1) NULL,
	[indirizzo_new] [char](40) NULL,
	[indirizzo_old] [char](40) NULL,
	[cognome_old] [char](24) NULL,
	[nome_old] [char](20) NULL,
	[nmr_invio] [int] NULL,
	[data] [char](8) NULL,
	[data2] [char](8) NULL,
	[data_elab] [char](8) NULL,
	[flag_val] [char](1) NOT NULL,
	[stato_ser_tit_prec] [char](1) NULL,
	[cap] [char](5) NULL,
	[provincia] [char](2) NULL,
	[comune] [char](24) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
