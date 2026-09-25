/****** Object:  Table [dbo].[SpostamentiRic]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpostamentiRic](
	[Idspostamento] [int] IDENTITY(1,1) NOT NULL,
	[IdRic] [int] NULL,
	[IdDa] [int] NULL,
	[TipoDa] [int] NULL,
	[IdA] [int] NULL,
	[TipoA] [int] NULL,
	[Data] [smalldatetime] NULL,
	[MacroDa] [int] NULL,
	[MacroA] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Idspostamento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
