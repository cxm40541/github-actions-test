/****** Object:  Table [dbo].[MAG_TipoLuogo]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MAG_TipoLuogo](
	[IdTipoLuogo] [int] NULL,
	[Etichetta] [varchar](50) NULL,
	[DesTipoLuogo] [varchar](10) NULL,
	[TipoApparecchio] [varchar](10) NULL,
	[TabellaName] [varchar](30) NULL,
	[TabellaFk] [varchar](30) NULL,
	[TabellaDecode] [varchar](30) NULL,
	[TabellaMore] [varchar](30) NULL,
	[TabellaCtiteria] [varchar](200) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
