/****** Object:  Table [dbo].[PagamentiISI]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagamentiISI](
	[IdPagamentoISI] [int] IDENTITY(1,1) NOT NULL,
	[Mese] [int] NULL,
	[Anno] [int] NULL,
	[CodiceOggetto] [int] NULL,
	[TipoOggetto] [int] NULL,
	[IdSocieta] [int] NULL,
	[IdAssociato] [int] NULL,
	[Importo] [float] NULL
) ON [DATA]
GO
