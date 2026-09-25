/****** Object:  Table [dbo].[bizArticoli]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bizArticoli](
	[IdArticolo] [int] IDENTITY(1,1) NOT NULL,
	[CodiceArticolo] [char](20) NULL,
	[Articolo] [char](100) NULL,
	[Quantita] [float] NULL,
	[IdMagazzino] [int] NULL,
	[IdFornitore] [int] NULL,
	[Marca] [char](50) NULL,
	[ParTipoArticolo] [int] NULL,
	[PrezzoUnitario] [float] NULL,
	[IVAPerc] [float] NULL,
	[ValoreMagazzino] [float] NULL,
	[Sistemazione] [char](255) NULL,
	[DataUltimoCarico] [smalldatetime] NULL,
	[DataUltimoScarico] [smalldatetime] NULL,
	[BizMacro] [int] NULL,
	[SottoScorta] [int] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
