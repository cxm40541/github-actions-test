/****** Object:  Table [dbo].[FattureRete]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FattureRete](
	[IdFatturaRete] [int] IDENTITY(1,1) NOT NULL,
	[Numero] [varchar](20) NULL,
	[Data] [smalldatetime] NULL,
	[IdLocale] [int] NULL,
	[IdSocieta] [int] NULL,
	[Imponibile] [float] NULL,
	[Totale] [float] NULL,
	[Iva] [float] NULL,
	[AliquotaIva] [int] NULL,
	[DataDa] [smalldatetime] NULL,
	[DataA] [smalldatetime] NULL,
	[Importo] [float] NULL,
	[Percentuale] [int] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
