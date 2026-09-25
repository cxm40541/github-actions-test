/****** Object:  Table [dbo].[Massivi]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Massivi](
	[id_guasto] [int] NULL,
	[desc_guasto] [varchar](50) NULL,
	[data_inizio_guasto] [datetime] NULL,
	[data_fine_guasto] [datetime] NULL,
	[terminali_coinvolti] [int] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
