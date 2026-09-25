/****** Object:  Table [dbo].[user_password]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_password](
	[rep] [varchar](32) NOT NULL,
	[psw_1] [nvarchar](128) NOT NULL,
	[psw_2] [nvarchar](128) NOT NULL,
	[psw_3] [nvarchar](128) NOT NULL,
	[psw_4] [nvarchar](128) NOT NULL,
	[psw_5] [nvarchar](128) NOT NULL,
	[data_mod] [char](8) NOT NULL,
	[data_scad] [char](8) NOT NULL,
	[num_tentativo] [int] NOT NULL,
	[bloccato] [char](1) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
