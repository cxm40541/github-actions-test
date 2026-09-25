/****** Object:  Table [dbo].[Corrispettivi]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Corrispettivi](
	[IdCorrispettivo] [int] IDENTITY(1,1) NOT NULL,
	[DataDocumento] [smalldatetime] NULL,
	[IdLocale] [int] NULL,
	[IdSocieta] [int] NULL,
	[IdConcessionario] [int] NULL,
	[Lordo] [float] NULL,
	[ParteLoc] [float] NULL,
	[ParteSoc] [float] NULL,
	[Rete] [float] NULL,
	[AAMS] [float] NULL,
	[Preu] [float] NULL,
	[TotIn] [float] NULL,
	[TotOut] [float] NULL,
	[TotRitirato] [float] NULL,
	[DataDa] [smalldatetime] NULL,
	[DataA] [smalldatetime] NULL,
	[Controfirmata] [bit] NULL,
	[SkipCinCout] [bit] NULL,
	[Numero] [varchar](20) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
