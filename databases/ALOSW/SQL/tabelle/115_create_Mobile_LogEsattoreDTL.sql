/****** Object:  Table [dbo].[Mobile_LogEsattoreDTL]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mobile_LogEsattoreDTL](
	[IdLogEsattoreGiro] [int] IDENTITY(1,1) NOT NULL,
	[FkLogEsattore] [int] NULL,
	[DataOra] [varchar](50) NULL,
	[Riferimento] [varchar](250) NULL,
	[Azione] [varchar](250) NULL,
	[ValoreAttuale] [varchar](250) NULL,
	[ValorePrecedente] [varchar](250) NULL,
	[Progressivo] [int] NULL,
	[Tipo] [varchar](50) NULL,
	[Latitudine] [float] NULL,
	[Longitudine] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLogEsattoreGiro] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
