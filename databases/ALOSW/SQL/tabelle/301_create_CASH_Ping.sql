/****** Object:  Table [dbo].[CASH_Ping]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CASH_Ping](
	[IdPing] [int] IDENTITY(1,1) NOT NULL,
	[LastUpdate] [datetime] NULL,
	[Esattore] [varchar](50) NULL,
	[NomeLocale] [varchar](80) NULL,
	[Azone] [varchar](100) NULL,
	[DeviceID] [varchar](50) NULL,
	[SoftwareVersion] [varchar](20) NULL,
	[Latitudine] [float] NULL,
	[Longitudine] [float] NULL,
	[Money] [float] NULL,
	[NumAction] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPing] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
