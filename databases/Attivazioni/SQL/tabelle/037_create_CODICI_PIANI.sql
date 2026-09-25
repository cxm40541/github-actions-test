/****** Object:  Table [dbo].[CODICI_PIANI]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CODICI_PIANI](
	[codice_tipo_piano] [char](2) NOT NULL,
	[desc_tipo_piano] [char](50) NOT NULL,
	[codice_utile] [char](10) NULL,
	[nro_term] [int] NULL,
	[nro_prt] [int] NULL,
 CONSTRAINT [PK_CODICI_PIANI] PRIMARY KEY CLUSTERED 
(
	[codice_tipo_piano] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
