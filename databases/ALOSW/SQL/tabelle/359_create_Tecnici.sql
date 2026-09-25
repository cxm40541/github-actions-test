/****** Object:  Table [dbo].[Tecnici]    Script Date: 11/17/2025 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tecnici](
	[IdTecnico] [int] IDENTITY(1,1) NOT NULL,
	[NomeTecnico] [char](50) NULL,
	[IndirizzoPrivato] [char](200) NULL,
	[Cellulare] [char](20) NULL,
	[Email] [char](100) NULL,
	[TelefonoPrivato] [char](50) NULL,
	[CodiceTecnico] [varchar](50) NULL,
	[CellKey] [varchar](20) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
