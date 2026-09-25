/****** Object:  Table [dbo].[Img]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Img](
	[IdImg] [int] IDENTITY(1,1) NOT NULL,
	[NomeImg] [varchar](50) NULL,
	[FileImg] [varchar](255) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
