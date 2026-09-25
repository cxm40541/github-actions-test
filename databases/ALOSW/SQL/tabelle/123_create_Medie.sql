/****** Object:  Table [dbo].[Medie]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Medie](
	[IdIncasso] [int] NULL,
	[DataIncassoA] [smalldatetime] NULL,
	[DataIncassoP] [smalldatetime] NULL,
	[TipoIncassoP] [varchar](1) NULL,
	[GG] [int] NULL,
	[NumRicIncasso] [varchar](50) NULL,
	[swEsportato] [bit] NULL,
	[IdEsattore] [int] NULL,
	[IsSubstitute] [bit] NULL,
	[Contatore1pc] [float] NULL,
	[Contatore2pc] [float] NULL,
	[Contatore1Cash] [float] NULL,
	[Contatore2Cash] [float] NULL,
	[PercPc] [float] NULL,
	[PercCash] [float] NULL,
	[percsulnetto] [bit] NULL,
	[IsValidated] [bit] NULL,
	[DataIncassoEffettiva] [smalldatetime] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
