/****** Object:  Table [dbo].[RelPratica]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RelPratica](
	[IdRel] [int] IDENTITY(1,1) NOT NULL,
	[IdPratica] [int] NULL,
	[Data] [smalldatetime] NULL,
	[Tipo] [varchar](50) NULL,
	[Utente] [int] NULL,
	[Testo] [varchar](255) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
