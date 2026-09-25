/****** Object:  Table [dbo].[Benefit]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Benefit](
	[IdBen] [int] IDENTITY(1,1) NOT NULL,
	[IdLocale] [int] NULL,
	[ParTipoIncentivo] [int] NULL,
	[Data] [smalldatetime] NULL,
	[Importo] [float] NULL,
	[Descrizione] [varchar](250) NULL,
	[Estremi] [varchar](250) NULL,
	[Note] [varchar](250) NULL,
	[RichiestoDa] [varchar](250) NULL,
	[SwFatturato] [bit] NULL,
	[Trasferito] [int] NULL,
	[ParStatoIncentivo] [int] NULL,
	[IdAgente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdBen] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
