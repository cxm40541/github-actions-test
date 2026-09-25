/****** Object:  Table [dbo].[mobile_users]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mobile_users](
	[IdMobileUser] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
	[Note] [varchar](255) NULL,
	[IdEsattore] [int] NULL,
	[IdTecnico] [int] NULL,
	[Seriale] [varchar](50) NULL,
	[PinCode] [varchar](20) NULL,
	[bIncassi] [bit] NULL,
	[bMessaggi] [bit] NULL,
	[bAttivita] [bit] NULL,
	[bSpostamenti] [bit] NULL,
	[bGuasti] [bit] NULL,
	[bStatistiche] [bit] NULL,
	[bViewAll] [bit] NULL,
	[bAttivo] [bit] NULL,
	[fklocali] [varchar](8000) NULL,
	[IdUser] [int] NULL,
	[fkreport] [varchar](8000) NULL,
	[idAgente] [int] NULL,
	[LastLoginISO] [varchar](50) NULL,
	[LastIP] [varchar](20) NULL,
	[LastToken] [varchar](50) NULL,
	[SessionCode] [varchar](50) NULL,
	[LastDevice] [varchar](50) NULL,
	[LastApp] [varchar](50) NULL,
	[LastVersion] [varchar](20) NULL,
	[bOnConsole] [bit] NULL,
	[Email] [varchar](100) NULL,
	[Telefono] [varchar](50) NULL,
	[bTckCenter] [bit] NULL,
	[bTckCenterAdmin] [bit] NULL,
	[bTckAPP] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMobileUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
