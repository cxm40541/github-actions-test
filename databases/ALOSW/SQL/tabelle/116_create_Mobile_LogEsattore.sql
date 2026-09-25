/****** Object:  Table [dbo].[Mobile_LogEsattore]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mobile_LogEsattore](
	[IdLogEsattoreGiro] [int] IDENTITY(1,1) NOT NULL,
	[IdEsattore] [int] NULL,
	[IdUtente] [int] NULL,
	[BollettaIncasso] [int] NULL,
	[Sezionale] [int] NULL,
	[Data] [smalldatetime] NULL,
	[IdAutovettura] [int] NULL,
	[KMIniziali] [varchar](50) NULL,
	[KMFinali] [varchar](50) NULL,
	[Versione] [varchar](50) NULL,
	[SessionWork] [varchar](50) NULL,
	[FkAction] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLogEsattoreGiro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
