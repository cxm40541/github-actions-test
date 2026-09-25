/****** Object:  Table [dbo].[counter]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[counter](
	[item] [varchar](50) NULL,
	[last_one] [int] NULL,
	[change_dt] [datetime] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
