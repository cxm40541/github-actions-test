/****** Object:  Table [dbo].[locGiriAgenti]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[locGiriAgenti](
	[GiroAgente] [int] NULL,
	[Locale] [int] NULL,
	[Giorno] [int] NULL,
	[Pri] [bit] NOT NULL,
	[Par] [bit] NOT NULL,
	[Dis] [bit] NOT NULL,
	[Ord] [int] NOT NULL
) ON [DATA]
GO
