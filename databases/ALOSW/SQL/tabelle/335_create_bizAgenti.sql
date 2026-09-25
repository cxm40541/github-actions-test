/****** Object:  Table [dbo].[bizAgenti]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bizAgenti](
	[IdAgente] [int] IDENTITY(1,1) NOT NULL,
	[Codice] [nvarchar](10) NULL,
	[Nome] [nvarchar](80) NULL,
	[Indirizzo] [nvarchar](120) NULL,
	[Citta] [nvarchar](120) NULL,
	[PIVA] [nvarchar](20) NULL,
	[Percentuale] [real] NULL,
	[CodiceSiae] [nvarchar](10) NULL,
	[PercComma6] [real] NULL,
	[CellAgente] [varchar](50) NULL,
	[BizMacro] [int] NULL,
	[NumRiga] [int] NULL,
	[bAcquisito] [bit] NULL,
	[NumRiga2] [int] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
