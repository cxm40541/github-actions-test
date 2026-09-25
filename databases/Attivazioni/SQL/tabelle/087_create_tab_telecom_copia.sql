/****** Object:  Table [dbo].[tab_telecom_copia]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tab_telecom_copia](
	[COD_LOTTO] [char](6) NOT NULL,
	[COD_AMM] [char](6) NULL,
	[POSTAZIONE] [char](2) NOT NULL,
	[SDLC_SDLC] [int] NULL,
	[DATA_INVIO] [datetime] NULL,
	[STATO_LAVORAZIONE] [char](1) NULL,
	[UTENTE] [char](6) NULL,
	[DATA_INI_LAV] [datetime] NULL,
	[DATA_END_LAV] [datetime] NULL,
	[FLAG_RETE] [char](1) NULL,
	[FLAG_VERBALE] [char](1) NULL,
	[CONT_VERBALE] [char](1) NULL,
	[DATA_VERBALE] [char](8) NULL,
	[TATIP] [char](2) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
