/****** Object:  Table [dbo].[ParGenereLocale]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParGenereLocale](
	[IdPar] [int] IDENTITY(1,1) NOT NULL,
	[Descrizione] [nvarchar](50) NULL,
	[IdCategoriaMonopoli] [int] NULL
) ON [DATA]
GO
