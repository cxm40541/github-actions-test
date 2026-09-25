/****** Object:  Table [dbo].[cu_associazione]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cu_associazione](
	[cod_lottomatica] [char](6) NOT NULL,
	[cognome_tit] [char](24) NULL,
	[nome_tit] [char](20) NULL,
	[stato_cu] [char](1) NULL,
	[associazione] [char](1) NULL,
	[cognome_doc] [char](24) NULL,
	[nome_doc] [char](20) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
