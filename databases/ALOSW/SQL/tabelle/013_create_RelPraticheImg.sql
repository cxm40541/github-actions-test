/****** Object:  Table [dbo].[RelPraticheImg]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelPraticheImg](
	[IdRel] [int] IDENTITY(1,1) NOT NULL,
	[IdPratica] [int] NULL,
	[IdImgPra] [int] NULL
) ON [DATA]
GO
