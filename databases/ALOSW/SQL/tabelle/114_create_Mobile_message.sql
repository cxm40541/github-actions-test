/****** Object:  Table [dbo].[Mobile_message]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mobile_message](
	[IdMsg] [int] IDENTITY(1,1) NOT NULL,
	[IdUsrRemote] [int] NULL,
	[IdUsrLocal] [int] NULL,
	[IdLocale] [int] NULL,
	[Direzione] [varchar](5) NULL,
	[bLetto] [bit] NULL,
	[bInviato] [bit] NULL,
	[bNotifica] [bit] NULL,
	[bAll] [bit] NULL,
	[Data] [smalldatetime] NULL,
	[Scadenza] [smalldatetime] NULL,
	[DataSave] [smalldatetime] NULL,
	[Tipo] [varchar](20) NULL,
	[Ambito] [varchar](30) NULL,
	[Messaggio] [varchar](8000) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMsg] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
