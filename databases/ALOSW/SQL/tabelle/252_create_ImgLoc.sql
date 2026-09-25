/****** Object:  Table [dbo].[ImgLoc]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ImgLoc](
	[IdImgLoc] [int] IDENTITY(1,1) NOT NULL,
	[NomeImgLoc] [varchar](50) NULL,
	[FileImgLoc] [varchar](255) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
