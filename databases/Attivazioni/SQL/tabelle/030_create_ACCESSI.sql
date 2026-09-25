/****** Object:  Table [dbo].[ACCESSI]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ACCESSI](
	[user] [char](10) NOT NULL,
	[data_accesso] [datetime] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
