/****** Object:  Table [dbo].[INGEST]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[INGEST](
	[ingest_ispet] [char](15) NULL,
	[ingest_key_ruota] [char](2) NOT NULL,
	[ingest_key_prog_ric] [char](4) NOT NULL,
	[ingest_prov] [char](2) NULL,
	[ingest_num_ricev] [char](4) NULL,
	[ingest_cognome] [char](24) NULL,
	[ingest_nome] [char](20) NULL,
	[ingest_indirizzo] [char](40) NULL,
	[ingest_comune] [char](25) NULL,
	[ingest_tel_ric] [char](12) NULL,
	[ingest_in_gioco] [char](10) NULL,
	[ingest_num_tabac] [char](6) NULL,
	[ingest_data_add] [char](10) NULL,
	[ingest_ter] [char](1) NULL,
	[ingest_dors] [char](5) NULL,
	[ingest_data_on] [char](10) NULL,
	[ingest_data_st] [char](10) NULL,
	[ingest_data_com] [char](10) NULL,
	[ingest_flag_ok] [char](1) NULL,
	[ingest_ctrricev] [int] NULL,
	[ingest_provincie] [char](500) NULL,
	[ingest_tempo] [char](8) NULL,
	[ingest_numeropagine] [char](10) NULL,
	[ingest_data_esecuzione] [char](10) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
