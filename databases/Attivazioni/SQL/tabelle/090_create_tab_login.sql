/****** Object:  Table [dbo].[tab_login]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tab_login](
	[LOGIN] [char](6) NULL,
	[PASSWORD] [char](20) NULL,
	[COGNOME] [char](20) NULL,
	[NOME] [char](20) NULL,
	[TIPO_UTENTE] [char](1) NULL,
	[Data_Inserimento_Passw] [datetime] NULL,
	[Richiesta_Passw] [numeric](18, 0) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
