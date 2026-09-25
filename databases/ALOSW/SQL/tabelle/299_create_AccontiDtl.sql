/****** Object:  Table [dbo].[AccontiDtl]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccontiDtl](
	[IdAccontoDTL] [int] IDENTITY(1,1) NOT NULL,
	[DataAcconto] [smalldatetime] NULL,
	[IdAcconto] [int] NULL,
	[CodiceOggetto] [int] NULL,
	[TipoOggetto] [int] NULL,
	[Importo] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAccontoDTL] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
