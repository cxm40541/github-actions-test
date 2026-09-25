/****** Object:  Table [dbo].[GiriAgenti]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiriAgenti](
	[IdGiroAgente] [int] IDENTITY(1,1) NOT NULL,
	[Codice] [nvarchar](10) NULL,
	[IdAgente] [int] NULL,
	[Giorno] [nvarchar](10) NULL,
	[Descrizione] [nvarchar](120) NULL,
	[NomeAgente] [nvarchar](80) NULL,
	[Via] [nvarchar](120) NULL,
	[CAP] [nvarchar](10) NULL,
	[Citta] [nvarchar](120) NULL,
	[Perc] [int] NULL
) ON [DATA]
GO
