/****** Object:  Table [dbo].[lst02a_cez_ssc]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lst02a_cez_ssc](
	[lst02a_matricola] [char](11) NOT NULL,
	[lst02a_ricevitoria] [char](6) NOT NULL,
	[lst02a_terminale] [char](1) NOT NULL,
	[lst02a_data_instal] [char](8) NULL,
	[lst02a_data_disinstal] [char](8) NULL,
	[lst02a_stato_term] [char](1) NULL,
	[lst02a_badge_attiv] [char](7) NULL,
	[lst02a_badge_disattiv] [char](7) NULL,
	[lst02a_scontrino] [char](11) NULL,
	[lst02a_vers_sw_lav] [char](3) NULL,
	[lst02a_vers_sw_avv] [char](3) NULL,
	[lst02a_sdlc_fut] [char](2) NULL,
	[lst02a_sdlc] [char](1) NULL,
	[lst02a_ora_attiv] [char](4) NULL,
	[lst02a_ora_disattiv] [char](4) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
