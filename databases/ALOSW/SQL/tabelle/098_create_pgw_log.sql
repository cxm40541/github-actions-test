/****** Object:  Table [dbo].[pgw_log]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pgw_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[logdate] [datetime] NOT NULL,
	[metodo] [varchar](32) NOT NULL,
	[user_name] [varchar](32) NOT NULL,
	[logtext] [varchar](250) NOT NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
