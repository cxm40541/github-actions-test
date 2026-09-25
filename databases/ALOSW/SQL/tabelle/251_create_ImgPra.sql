/****** Object:  Table [dbo].[ImgPra]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ImgPra](
	[IdImgPra] [int] IDENTITY(1,1) NOT NULL,
	[NomeImgPra] [varchar](50) NULL,
	[FileImgPra] [varchar](255) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
