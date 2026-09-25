/****** Object:  Table [dbo].[TEMPGESTIONE]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TEMPGESTIONE](
	[Ricevitoria] [varchar](6) NOT NULL,
	[id_piano] [char](10) NOT NULL,
	[flag_linea] [char](1) NOT NULL,
	[flag_selezione] [char](1) NOT NULL,
	[stringa_file] [char](68) NOT NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
