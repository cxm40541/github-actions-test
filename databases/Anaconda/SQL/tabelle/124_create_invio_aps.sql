/****** Object:  Table [dbo].[invio_aps]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[invio_aps](
	[invio_aps_id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[invio_aps_key_id_ricev] [char](6) NOT NULL,
	[invio_aps_key_servizio] [char](1) NOT NULL,
	[invio_aps_cod_amm] [char](6) NULL,
	[invio_aps_cognome_new] [char](24) NULL,
	[invio_aps_nome_new] [char](20) NULL,
	[invio_aps_stato] [char](1) NULL,
	[invio_aps_contratto] [char](1) NULL,
	[invio_aps_fidejussione] [char](1) NULL,
	[invio_aps_indirizzo_new] [char](40) NULL,
	[invio_aps_indirizzo_old] [char](40) NULL,
	[invio_aps_cognome_old] [char](24) NULL,
	[invio_aps_nome_old] [char](20) NULL,
	[invio_aps_nmr_invio] [int] NULL,
	[invio_aps_data] [char](8) NULL,
	[invio_aps_ser_tit_prec] [char](1) NULL,
	[invio_aps_data_elab] [char](8) NULL,
	[invio_aps_flag_val] [char](1) NOT NULL,
	[invio_aps_cap] [char](5) NULL,
	[invio_aps_comune] [char](24) NULL,
	[invio_aps_provincia] [char](2) NULL,
	[invio_aps_firma] [char](17) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
