/****** Object:  Table [dbo].[bizforn]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bizforn](
	[IdFornitore] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](80) NULL,
	[Contatto] [nvarchar](50) NULL,
	[Indirizzo] [nvarchar](120) NULL,
	[CAP] [nvarchar](6) NULL,
	[Comune] [nvarchar](120) NULL,
	[Provincia] [nvarchar](5) NULL,
	[PIVA] [nvarchar](20) NULL,
	[Tel] [nvarchar](20) NULL,
	[Tel2] [nvarchar](20) NULL,
	[Fax] [nvarchar](20) NULL,
	[Email] [nvarchar](50) NULL,
	[CodiceFiscale] [varchar](20) NULL,
	[BizMacro] [int] NULL,
	[Note] [varchar](255) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
