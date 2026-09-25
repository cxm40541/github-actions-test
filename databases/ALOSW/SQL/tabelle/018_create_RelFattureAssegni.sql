/****** Object:  Table [dbo].[RelFattureAssegni]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelFattureAssegni](
	[IdRel] [int] IDENTITY(1,1) NOT NULL,
	[IdAssegno] [int] NULL,
	[IdFattura] [int] NULL
) ON [DATA]
GO
