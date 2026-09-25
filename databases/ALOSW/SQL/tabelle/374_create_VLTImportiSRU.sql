/****** Object:  Table [dbo].[VLTImportiSRU]    Script Date: 11/17/2025 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VLTImportiSRU](
	[IdImporto] [int] IDENTITY(1,1) NOT NULL,
	[IdLocale] [int] NULL,
	[BollettaIncasso] [int] NULL,
	[Data] [smalldatetime] NULL,
	[Importo] [float] NULL,
	[Ticket] [int] NULL,
	[Tipo] [varchar](10) NULL,
	[Note] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdImporto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
