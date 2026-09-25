/****** Object:  Table [dbo].[Automezzi]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Automezzi](
	[IdAutomezzo] [int] IDENTITY(1,1) NOT NULL,
	[Modello] [varchar](50) NULL,
	[Targa] [varchar](10) NULL,
	[Descrizione] [varchar](100) NULL,
	[IsDeleted] [bit] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
