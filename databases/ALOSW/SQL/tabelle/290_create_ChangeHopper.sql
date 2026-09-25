/****** Object:  Table [dbo].[ChangeHopper]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChangeHopper](
	[IdMov] [int] IDENTITY(1,1) NOT NULL,
	[FkHopper] [int] NULL,
	[FkLocale] [int] NULL,
	[FkChange] [int] NULL,
	[Data] [smalldatetime] NULL,
	[Importo] [float] NULL,
	[Carica] [float] NULL,
	[Taglio] [varchar](30) NULL,
	[FkEsattore] [int] NULL,
	[BollettaIncasso] [int] NULL,
	[Sezionale] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMov] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
