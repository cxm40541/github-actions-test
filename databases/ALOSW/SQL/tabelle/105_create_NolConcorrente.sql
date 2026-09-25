/****** Object:  Table [dbo].[NolConcorrente]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NolConcorrente](
	[IdNolConc] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NULL,
	[Titolare] [varchar](50) NULL,
	[Agente] [varchar](50) NULL,
	[Sede] [varchar](250) NULL,
	[Comma6] [int] NULL,
	[Altri] [int] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
