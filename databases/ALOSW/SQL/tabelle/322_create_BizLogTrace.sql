/****** Object:  Table [dbo].[BizLogTrace]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BizLogTrace](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[sAction] [nvarchar](50) NULL,
	[sKey] [nvarchar](50) NULL,
	[sTable] [nvarchar](50) NULL,
	[sNote] [nvarchar](3310) NULL,
	[IdUser] [int] NULL,
	[UserNameClear] [nvarchar](50) NULL,
	[DataAction] [smalldatetime] NULL,
	[Versione] [nvarchar](50) NULL,
	[IdBiz] [nvarchar](50) NULL,
	[BizName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
