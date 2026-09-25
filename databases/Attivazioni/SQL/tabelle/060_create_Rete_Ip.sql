/****** Object:  Table [dbo].[Rete_Ip]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rete_Ip](
	[RUOTA] [varchar](20) NOT NULL,
	[MODRIF] [char](1) NOT NULL,
	[IND_FTP] [varchar](30) NULL,
	[IND_HOST] [varchar](30) NULL,
	[NUMERO_VERDE_ISDN_B] [varchar](30) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
