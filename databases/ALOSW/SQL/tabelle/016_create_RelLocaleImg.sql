/****** Object:  Table [dbo].[RelLocaleImg]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelLocaleImg](
	[IdRel] [int] IDENTITY(1,1) NOT NULL,
	[IdLocale] [int] NULL,
	[IdImgLoc] [int] NULL
) ON [DATA]
GO
