/****** Object:  Table [dbo].[BonusLocaleVoci]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BonusLocaleVoci](
	[IdBonusLocaleVoci] [int] IDENTITY(1,1) NOT NULL,
	[IdBonusLocale] [int] NULL,
	[Da] [float] NULL,
	[A] [float] NULL,
	[Percentuale] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdBonusLocaleVoci] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
