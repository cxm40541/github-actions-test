/****** Object:  Table [dbo].[MAG_RicTipoLuogo]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MAG_RicTipoLuogo](
	[IdRicTipoLuogo] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoLuogo] [int] NULL,
	[IdParTipoRicambio] [int] NULL,
	[Etichetta] [varchar](50) NULL,
	[Ordinamento] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRicTipoLuogo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
