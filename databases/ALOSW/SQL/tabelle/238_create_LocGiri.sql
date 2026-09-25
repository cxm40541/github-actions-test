/****** Object:  Table [dbo].[LocGiri]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LocGiri](
	[Giro] [int] NULL,
	[Locale] [int] NULL,
	[Giorno] [int] NULL,
	[Pri] [bit] NULL,
	[Par] [bit] NULL,
	[Dis] [bit] NULL,
	[Ord] [int] NULL,
	[Sec] [bit] NULL,
	[Ter] [bit] NULL,
	[Qua] [bit] NULL,
	[uoq] [bit] NULL,
	[TipoGL] [int] NULL,
	[DescTipoGL] [varchar](5) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
