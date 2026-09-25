/****** Object:  Table [dbo].[Pratiche]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pratiche](
	[IdPratica] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoPratica] [int] NULL,
	[IdApparecchio] [int] NULL,
	[IdLocale] [int] NULL,
	[IdConc] [int] NULL,
	[Referente] [varchar](50) NULL,
	[IdUtente] [int] NULL,
	[CodPratica] [varchar](50) NULL,
	[CodInterno] [varchar](50) NULL,
	[DataEvento] [smalldatetime] NULL,
	[DataApertura] [smalldatetime] NULL,
	[Stato] [varchar](1) NULL,
	[DataChiusura] [smalldatetime] NULL,
	[DataReminder] [smalldatetime] NULL,
	[TestoReminder] [varchar](100) NULL,
	[DataAllarm] [smalldatetime] NULL,
	[Note] [varchar](255) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
