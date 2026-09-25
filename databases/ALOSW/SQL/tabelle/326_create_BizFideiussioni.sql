/****** Object:  Table [dbo].[BizFideiussioni]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BizFideiussioni](
	[IdFide] [int] IDENTITY(1,1) NOT NULL,
	[Idsocieta] [int] NULL,
	[BizMacro] [int] NULL,
	[DataRilascio] [smalldatetime] NULL,
	[Datascadenza] [smalldatetime] NULL,
	[ParTipoAss] [int] NULL,
	[Importo] [float] NULL,
	[Costo] [float] NULL,
	[NumMacchine] [int] NULL,
	[ImportoUnitario] [float] NULL,
	[Ente] [varchar](50) NULL,
	[Note] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdFide] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
