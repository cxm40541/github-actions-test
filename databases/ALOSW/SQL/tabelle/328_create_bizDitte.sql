/****** Object:  Table [dbo].[bizDitte]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bizDitte](
	[IdAgente] [int] IDENTITY(1,1) NOT NULL,
	[Codice] [nvarchar](10) NULL,
	[Nome] [nvarchar](80) NULL,
	[Indirizzo] [nvarchar](120) NULL,
	[Citta] [nvarchar](120) NULL,
	[PIVA] [nvarchar](20) NULL,
	[Percentuale] [real] NULL,
	[CodiceSiae] [nvarchar](10) NULL,
	[PercComma6] [int] NULL,
	[BizMacro] [int] NULL
) ON [DATA]
GO
