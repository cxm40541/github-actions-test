/****** Object:  Table [dbo].[Mobile_session]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mobile_session](
	[IdSessione] [int] IDENTITY(1,1) NOT NULL,
	[Data] [smalldatetime] NULL,
	[DataComplete] [smalldatetime] NULL,
	[SessionCode] [varchar](50) NULL,
	[fkUserRemote] [int] NULL,
	[Giri] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSessione] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
