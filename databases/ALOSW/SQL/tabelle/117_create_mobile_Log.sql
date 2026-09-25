/****** Object:  Table [dbo].[mobile_Log]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mobile_Log](
	[IdMobileLog] [int] IDENTITY(1,1) NOT NULL,
	[IdMobileAction] [int] NULL,
	[IdLocale] [int] NULL,
	[CodiceOggetto] [int] NULL,
	[TipoOggetto] [int] NULL,
	[IdEsattore] [int] NULL,
	[Progressivo] [varchar](50) NULL,
	[IndiceLocale] [varchar](50) NULL,
	[Data] [smalldatetime] NULL,
	[IndiceApparecchio] [varchar](50) NULL,
	[TipoAzione] [varchar](50) NULL,
	[ValorePre] [varchar](50) NULL,
	[ValoreAtt] [varchar](50) NULL,
	[CCode] [varchar](50) NULL,
	[Allarmi] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMobileLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
