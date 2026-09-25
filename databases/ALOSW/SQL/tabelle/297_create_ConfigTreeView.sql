/****** Object:  Table [dbo].[ConfigTreeView]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfigTreeView](
	[Id] [int] NOT NULL,
	[KeyPadre] [nvarchar](20) NULL,
	[KeyFiglio] [nvarchar](20) NULL,
	[Descrizione] [nvarchar](80) NULL,
	[Bold] [bit] NOT NULL,
	[Icona] [smallint] NULL,
	[Macro] [smallint] NULL,
	[Attiva] [bit] NOT NULL,
	[Anno] [nvarchar](3) NULL,
	[bNoTreeView] [bit] NULL
) ON [DATA]
GO
