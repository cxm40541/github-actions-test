/****** Object:  Table [dbo].[RicambiLavorazione]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RicambiLavorazione](
	[IdLavorazione] [int] IDENTITY(1,1) NOT NULL,
	[Data] [smalldatetime] NULL,
	[NomeGioco] [varchar](100) NULL,
	[NomeMobile] [varchar](100) NULL,
	[Scheda] [varchar](50) NULL,
	[CodProvvisorio] [varchar](50) NULL,
	[Matricola] [varchar](50) NULL,
	[BC_Mobile] [varchar](50) NULL,
	[BC_Scheda] [varchar](50) NULL,
	[Destinatario] [varchar](100) NULL,
	[IdSocieta] [int] NULL,
	[RDA] [varchar](100) NULL,
	[Tecnico] [varchar](100) NULL,
	[Note] [varchar](100) NULL,
	[IdDedicato] [varchar](100) NULL,
	[processato] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLavorazione] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
