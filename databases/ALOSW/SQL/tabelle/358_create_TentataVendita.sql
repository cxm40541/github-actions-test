/****** Object:  Table [dbo].[TentataVendita]    Script Date: 11/17/2025 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TentataVendita](
	[IdTentataVendita] [int] IDENTITY(1,1) NOT NULL,
	[Data] [smalldatetime] NULL,
	[IdEsattore] [int] NULL,
	[BollaUscita] [char](30) NULL,
	[HUscita] [char](2) NULL,
	[MUscita] [char](2) NULL,
	[HRientro] [char](2) NULL,
	[MRientro] [char](2) NULL,
	[ValoreTotaleUscito] [float] NULL,
	[ValoreTotaleVenduto] [float] NULL,
	[IsChiusa] [bit] NULL,
	[IdSocieta] [int] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
