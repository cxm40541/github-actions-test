/****** Object:  Table [dbo].[ChangeLivelli]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChangeLivelli](
	[PkChangeLivelli] [int] IDENTITY(1,1) NOT NULL,
	[FkChange] [int] NULL,
	[FkEsattore] [int] NULL,
	[FkUserId] [int] NULL,
	[FkUserNameClear] [varchar](100) NULL,
	[Data] [smalldatetime] NULL,
	[CntInMonete] [float] NULL,
	[CntOutMonete] [float] NULL,
	[CntInBanconote] [float] NULL,
	[CntOutBanconote] [float] NULL,
	[ParInMonete] [float] NULL,
	[ParOutMonete] [float] NULL,
	[ParInBanconote] [float] NULL,
	[ParOutBanconote] [float] NULL,
	[Note] [varchar](255) NULL,
	[swVerifica] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[PkChangeLivelli] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
