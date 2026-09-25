/****** Object:  Table [dbo].[RelCorrAssegni]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelCorrAssegni](
	[IdRel] [int] IDENTITY(1,1) NOT NULL,
	[idassegno] [int] NULL,
	[IdFattura] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
