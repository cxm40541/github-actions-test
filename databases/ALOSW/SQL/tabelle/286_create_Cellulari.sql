/****** Object:  Table [dbo].[Cellulari]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cellulari](
	[IdCellulare] [int] IDENTITY(1,1) NOT NULL,
	[Telefono] [varchar](50) NULL,
	[Seriale] [varchar](50) NULL,
	[PWD] [varchar](50) NULL,
	[Numero] [varchar](50) NULL,
	[CodAPP] [varchar](50) NULL,
	[Modello] [varchar](100) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
