/****** Object:  Table [dbo].[SpostamentiPda]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SpostamentiPda](
	[Idspostamento] [int] IDENTITY(1,1) NOT NULL,
	[IdMobile] [int] NULL,
	[IdDa] [int] NULL,
	[TipoDa] [int] NULL,
	[IdA] [int] NULL,
	[TipoA] [int] NULL,
	[Data] [int] NULL,
	[IdSocieta] [int] NULL,
	[RifSpostamento] [varchar](30) NULL,
	[IsBenestare] [bit] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
