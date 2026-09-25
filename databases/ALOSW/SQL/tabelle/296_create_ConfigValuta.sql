/****** Object:  Table [dbo].[ConfigValuta]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfigValuta](
	[ID] [int] NOT NULL,
	[Codice] [nvarchar](10) NULL,
	[Nome] [nvarchar](21) NULL,
	[TC] [real] NULL,
	[Icona] [smallint] NULL,
	[Formato] [nvarchar](50) NULL,
	[Sigla] [nvarchar](3) NULL
) ON [DATA]
GO
