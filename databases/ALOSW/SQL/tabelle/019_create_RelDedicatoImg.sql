/****** Object:  Table [dbo].[RelDedicatoImg]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelDedicatoImg](
	[IdRel] [int] IDENTITY(1,1) NOT NULL,
	[IdDedicato] [int] NULL,
	[IdImg] [int] NULL
) ON [DATA]
GO
