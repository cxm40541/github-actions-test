/****** Object:  Table [dbo].[ConfigFunzione]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConfigFunzione](
	[IdFunzione] [int] IDENTITY(1,1) NOT NULL,
	[Descrizione] [nvarchar](50) NULL,
	[Menu] [nvarchar](50) NULL,
	[Indice] [smallint] NULL
) ON [DATA]
GO
