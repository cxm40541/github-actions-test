/****** Object:  Table [dbo].[ParTipoAlimentatore]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParTipoAlimentatore](
	[IdPar] [int] IDENTITY(1,1) NOT NULL,
	[DescrizioneAlimentatore] [nvarchar](50) NULL
) ON [DATA]
GO
