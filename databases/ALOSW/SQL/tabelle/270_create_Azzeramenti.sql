/****** Object:  Table [dbo].[Azzeramenti]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Azzeramenti](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodeID] [varchar](50) NULL,
	[Matricola] [varchar](50) NULL,
	[CodiceOggetto] [int] NULL,
	[Modello] [varchar](100) NULL,
	[Data] [smalldatetime] NULL,
	[ParCausale] [int] NULL,
	[CntIN] [float] NULL,
	[CntOUT] [float] NULL,
	[Utente] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
