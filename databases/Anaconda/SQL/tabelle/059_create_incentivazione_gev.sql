/****** Object:  Table [dbo].[incentivazione_gev]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[incentivazione_gev](
	[cod_itgs] [nvarchar](7) NULL,
	[cluster] [nvarchar](3) NULL,
	[obiettivo] [nvarchar](20) NULL,
	[periodo_dal] [nvarchar](8) NULL,
	[periodo_al] [nvarchar](8) NULL
) ON [DATA]
GO
