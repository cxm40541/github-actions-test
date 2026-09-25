/****** Object:  Table [dbo].[DWH_ANAGRAFICA]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DWH_ANAGRAFICA](
	[Ricevitoria] [varchar](7) NULL,
	[Denominazione] [varchar](30) NULL,
	[Titolare] [varchar](30) NULL,
	[Cap] [varchar](5) NULL,
	[Indirizzo] [varchar](50) NULL,
	[Comune] [varchar](40) NULL,
	[Provincia] [varchar](2) NULL,
	[Regione] [varchar](30) NULL,
	[Telefono] [varchar](12) NULL,
	[Stato] [varchar](20) NULL,
	[Tsr] [varchar](3) NULL,
	[Contatto] [varchar](30) NULL,
	[Sales Allowed] [varchar](1) NULL,
	[Tipo] [varchar](10) NULL,
	[Dal] [varchar](10) NULL,
	[cod_lottomatica] [varchar](7) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
