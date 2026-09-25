/****** Object:  Table [dbo].[RelBonus]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RelBonus](
	[IdBonus] [int] IDENTITY(1,1) NOT NULL,
	[Importo] [int] NULL,
	[Idlocale] [int] NULL,
	[DataBonus] [int] NULL,
	[Data] [smalldatetime] NULL,
	[NoteBonus] [varchar](250) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
