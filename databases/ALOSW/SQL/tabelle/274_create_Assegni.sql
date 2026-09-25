/****** Object:  Table [dbo].[Assegni]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Assegni](
	[IdAssegno] [int] IDENTITY(1,1) NOT NULL,
	[Numero] [nvarchar](50) NULL,
	[DataAssegno] [smalldatetime] NULL,
	[ParBanca] [int] NULL,
	[Importo] [float] NULL,
	[DataRicezione] [smalldatetime] NULL,
	[IdSocieta] [int] NULL,
	[IdLocale] [int] NULL,
	[EmessoDa] [nvarchar](100) NULL,
	[IdVerificaConto] [int] NULL,
	[Protocollo] [int] NULL,
	[DataIncContab] [smalldatetime] NULL,
	[DataInsPrima] [smalldatetime] NULL,
	[DataInsSeconda] [smalldatetime] NULL,
	[DataPagAssegno] [smalldatetime] NULL,
	[Note] [varchar](255) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
