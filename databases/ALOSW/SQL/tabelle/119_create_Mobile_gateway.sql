/****** Object:  Table [dbo].[Mobile_gateway]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mobile_gateway](
	[IdGateway] [int] IDENTITY(1,1) NOT NULL,
	[Etichetta] [varchar](100) NULL,
	[URL] [varchar](250) NULL,
	[SiteKey] [varchar](50) NULL,
	[Versione] [varchar](50) NULL,
	[Build] [varchar](50) NULL,
	[Attivo] [bit] NULL,
	[VersionePadGate] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdGateway] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
