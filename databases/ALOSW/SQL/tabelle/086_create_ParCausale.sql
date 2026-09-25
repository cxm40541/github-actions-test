/****** Object:  Table [dbo].[ParCausale]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParCausale](
	[IdPar] [int] IDENTITY(1,1) NOT NULL,
	[Descrizione] [varchar](50) NULL,
	[Tipo] [varchar](7) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
