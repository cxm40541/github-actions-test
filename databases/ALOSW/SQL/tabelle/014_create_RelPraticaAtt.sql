/****** Object:  Table [dbo].[RelPraticaAtt]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RelPraticaAtt](
	[IdRel] [int] IDENTITY(1,1) NOT NULL,
	[IdParTipoPratica] [int] NULL,
	[TextRelPraticaAtt] [varchar](250) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
