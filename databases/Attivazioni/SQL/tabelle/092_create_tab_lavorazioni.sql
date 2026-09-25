/****** Object:  Table [dbo].[tab_lavorazioni]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tab_lavorazioni](
	[COD_LOTTO] [char](6) NULL,
	[COD_AMM] [char](6) NULL,
	[POSTAZIONE] [char](2) NULL,
	[FLAG] [char](1) NULL,
	[DATA] [datetime] NULL,
	[CODICE] [char](5) NULL,
	[UTENTE] [char](6) NULL,
	[NOTE] [char](300) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
