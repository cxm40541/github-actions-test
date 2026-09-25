/****** Object:  Table [dbo].[tbUpdate]    Script Date: 11/17/2025 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbUpdate](
	[PkUpdate] [int] IDENTITY(1,1) NOT NULL,
	[Data] [smalldatetime] NULL,
	[Done] [bit] NULL,
	[Azione] [varchar](100) NULL,
	[FkUser] [int] NULL,
	[FkAction] [int] NULL,
	[FkKey] [varchar](20) NULL,
	[Trials] [int] NULL,
	[FkLocale] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PkUpdate] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
