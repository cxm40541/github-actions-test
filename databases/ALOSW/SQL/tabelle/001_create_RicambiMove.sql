/****** Object:  Table [dbo].[RicambiMove]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RicambiMove](
	[IdMovimento] [int] IDENTITY(1,1) NOT NULL,
	[DataMovimento] [smalldatetime] NULL,
	[fkRicambio] [int] NULL,
	[fkUser] [int] NULL,
	[IdParCausale] [int] NULL,
	[Quantita] [int] NULL,
	[LuogoDaId] [int] NULL,
	[LuogoDaTipo] [varchar](10) NULL,
	[LuogoAId] [int] NULL,
	[LuogoATipo] [varchar](10) NULL,
	[bGeneraDDT] [bit] NULL,
	[fkDDT] [bit] NULL,
	[Note] [varchar](250) NULL,
	[Location] [varchar](250) NULL,
	[fkDDT2] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMovimento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
