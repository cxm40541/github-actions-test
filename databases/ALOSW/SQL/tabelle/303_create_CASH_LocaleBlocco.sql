/****** Object:  Table [dbo].[CASH_LocaleBlocco]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CASH_LocaleBlocco](
	[IdBlocco] [int] IDENTITY(1,1) NOT NULL,
	[LastUpdate] [smalldatetime] NULL,
	[FkUserLast] [int] NULL,
	[FkLocale] [int] NULL,
	[Attivo] [bit] NULL,
	[LimiteSospeso] [float] NULL,
	[LimiteSconto] [float] NULL,
	[LimiteScarto] [float] NULL,
	[LimiteBonus] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdBlocco] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
