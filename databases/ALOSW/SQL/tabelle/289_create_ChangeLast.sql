/****** Object:  Table [dbo].[ChangeLast]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChangeLast](
	[IdLast] [int] IDENTITY(1,1) NOT NULL,
	[FkHopper] [int] NULL,
	[FkLocale] [int] NULL,
	[FkChange] [int] NULL,
	[NomeChange] [varchar](50) NULL,
	[Data] [smalldatetime] NULL,
	[Giorni] [int] NULL,
	[PercCiclo] [float] NULL,
	[LastRitiro] [float] NULL,
	[LastIntrodotto] [float] NULL,
	[LastCarica] [float] NULL,
	[FkEsattore] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLast] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
