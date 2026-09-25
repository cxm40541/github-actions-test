/****** Object:  Table [dbo].[ALO_MainLog]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ALO_MainLog](
	[IdLog] [int] IDENTITY(1,1) NOT NULL,
	[LogDate] [smalldatetime] NULL,
	[Codice] [int] NULL,
	[Versione] [varchar](30) NULL,
	[Modulo] [varchar](50) NULL,
	[Tipo] [varchar](20) NULL,
	[UserName] [varchar](60) NULL,
	[DeviceName] [varchar](60) NULL,
	[Messaggio] [varchar](250) NULL,
	[Extra] [varchar](8000) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLog] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
