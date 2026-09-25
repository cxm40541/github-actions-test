/****** Object:  Table [dbo].[Mobile_giriassegnati]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mobile_giriassegnati](
	[IdGiroAssegnato] [int] IDENTITY(1,1) NOT NULL,
	[IdEsattore] [int] NULL,
	[IdGiro] [int] NULL,
	[fkUser] [int] NULL,
	[LastUpdate] [smalldatetime] NULL,
	[Giorno] [varchar](20) NULL,
	[Sigla] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdGiroAssegnato] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
