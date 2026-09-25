/****** Object:  Table [dbo].[mobile_actions]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mobile_actions](
	[IdMobileAction] [int] IDENTITY(1,1) NOT NULL,
	[fkMobileUser] [int] NULL,
	[IP] [varchar](20) NULL,
	[Tipo] [varchar](20) NULL,
	[Data] [smalldatetime] NULL,
	[Descrizione] [varchar](250) NULL,
	[ProcessatoLOC] [bit] NULL,
	[ProcessatoREM] [bit] NULL,
	[Info] [varchar](8000) NULL,
	[TagContenuto] [varchar](100) NULL,
	[SessionCode] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMobileAction] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
