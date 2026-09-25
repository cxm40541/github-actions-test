/****** Object:  Table [dbo].[RelContatori]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelContatori](
	[IdRel] [int] IDENTITY(1,1) NOT NULL,
	[Id] [int] NULL,
	[Tipo] [int] NULL,
	[Contatore1] [float] NULL,
	[Contatore2] [float] NULL,
	[Contatore3] [float] NULL,
	[Contatore4] [float] NULL,
	[Prezzo1] [float] NULL,
	[Prezzo2] [float] NULL,
	[Prezzo3] [float] NULL,
	[Prezzo4] [float] NULL,
	[TipoIncasso] [int] NULL
) ON [DATA]
GO
