/****** Object:  Table [dbo].[RelArticoliVenduti]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RelArticoliVenduti](
	[IdRelArticoloVenduto] [int] IDENTITY(1,1) NOT NULL,
	[IdTentataVendita] [int] NULL,
	[IdArticolo] [int] NULL,
	[IdLocale] [int] NULL,
	[Quantita] [float] NULL,
	[PrezzoUnitario] [float] NULL,
	[Imponibile] [float] NULL,
	[IVAPerc] [float] NULL,
	[IVA] [float] NULL,
	[Totale] [float] NULL,
	[ValoreTotale] [float] NULL,
	[BollaVendita] [char](30) NULL,
	[DataMovimento] [smalldatetime] NULL,
	[TipoMovimento] [char](1) NULL,
	[ContoReso] [bit] NULL,
	[DataScadenzaReso] [smalldatetime] NULL,
	[DDT] [varchar](200) NULL,
	[Note] [varchar](250) NULL,
	[fkForn] [int] NULL,
	[fkDDT] [int] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
