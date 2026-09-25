/****** Object:  Table [dbo].[RelArticoliUsciti]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelArticoliUsciti](
	[IdRelArticoloUscito] [int] IDENTITY(1,1) NOT NULL,
	[IdTentataVendita] [int] NULL,
	[IdArticolo] [int] NULL,
	[Quantita] [float] NULL,
	[PrezzoUnitario] [float] NULL,
	[IVAPerc] [float] NULL,
	[ValoreTotale] [float] NULL
) ON [DATA]
GO
