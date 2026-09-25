/****** Object:  Table [dbo].[MacroTipoRicambi]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MacroTipoRicambi](
	[IdMacroTipoRicambio] [int] IDENTITY(1,1) NOT NULL,
	[IdMacro] [int] NULL,
	[IdPadre] [varchar](50) NULL,
	[Livello] [int] NULL,
	[IsFine] [bit] NULL,
	[Nome] [varchar](150) NULL,
	[FullNome] [varchar](255) NULL,
	[FirstLastNome] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMacroTipoRicambio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
