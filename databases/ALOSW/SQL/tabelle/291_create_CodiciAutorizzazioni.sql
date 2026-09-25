/****** Object:  Table [dbo].[CodiciAutorizzazioni]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CodiciAutorizzazioni](
	[IdCodice] [int] IDENTITY(1,1) NOT NULL,
	[IdEsattore] [int] NULL,
	[IdMacro] [int] NULL,
	[Data] [smalldatetime] NULL,
	[Tipo] [varchar](20) NULL,
	[Importo] [float] NULL,
	[UtenteLog] [varchar](150) NULL,
	[Codice] [varchar](5) NULL,
	[Note] [varchar](255) NULL,
	[Utilizzato] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCodice] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
