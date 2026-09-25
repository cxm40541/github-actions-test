/****** Object:  Table [dbo].[Acconti]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Acconti](
	[IdAcconto] [int] IDENTITY(1,1) NOT NULL,
	[codicelocale] [int] NULL,
	[Data] [smalldatetime] NULL,
	[BollettaIncasso] [int] NULL,
	[Importo] [float] NULL,
	[IdEsattore] [int] NULL,
	[Trasferito] [int] NULL,
	[IdSocieta] [int] NULL,
	[Sezionale] [int] NULL
) ON [DATA]
GO
