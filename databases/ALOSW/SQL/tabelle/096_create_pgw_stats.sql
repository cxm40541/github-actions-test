/****** Object:  Table [dbo].[pgw_stats]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pgw_stats](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[codice] [varchar](80) NULL,
	[descrizione] [nvarchar](4000) NULL,
	[descrizione_online] [nvarchar](4000) NULL,
	[testoqry] [nvarchar](4000) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
