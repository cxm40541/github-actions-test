/****** Object:  Table [dbo].[RMF_LOG]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RMF_LOG](
	[nome_file] [varchar](180) NULL,
	[tipologia_errore] [varchar](180) NULL,
	[cod_pdv] [varchar](180) NULL,
	[commento_analisi] [varchar](180) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
