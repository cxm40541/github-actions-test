/****** Object:  Table [dbo].[Furti]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Furti](
	[IdFurto] [int] IDENTITY(1,1) NOT NULL,
	[Data] [smalldatetime] NULL,
	[IdLocale] [int] NULL,
	[ParTipoFurti] [int] NULL,
	[Importo] [float] NULL,
	[Descrizione] [varchar](255) NULL,
	[ImportoAssorbito] [float] NULL,
	[ImportoDanni] [float] NULL,
	[swDenuncia] [bit] NULL,
	[swDanni] [bit] NULL,
	[Macchine] [varchar](255) NULL,
	[Valutazione] [varchar](255) NULL,
	[ParStatoFurti] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFurto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
