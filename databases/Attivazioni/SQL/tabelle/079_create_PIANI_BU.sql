/****** Object:  Table [dbo].[PIANI_BU]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PIANI_BU](
	[id_piano] [nvarchar](10) NOT NULL,
	[descrizione] [nvarchar](50) NULL,
	[anno] [int] NULL,
	[bu] [nvarchar](10) NULL,
	[tipologia] [nvarchar](50) NULL,
	[inizio] [smalldatetime] NULL,
	[fine] [smalldatetime] NULL,
	[tipo_piano] [char](2) NULL,
	[data_elab] [smalldatetime] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
