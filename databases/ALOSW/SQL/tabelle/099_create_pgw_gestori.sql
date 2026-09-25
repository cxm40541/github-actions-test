/****** Object:  Table [dbo].[pgw_gestori]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pgw_gestori](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NOT NULL,
	[gestore] [varchar](32) NOT NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
