/****** Object:  Table [dbo].[AWP_Visibilita]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AWP_Visibilita](
	[IdRec] [int] IDENTITY(1,1) NOT NULL,
	[CodeID] [varchar](20) NULL,
	[Modello] [varchar](50) NULL,
	[CNT_IN] [int] NULL,
	[CNT_OUT] [int] NULL,
	[Ubicazione] [varchar](100) NULL,
	[Status] [varchar](30) NULL,
	[Note] [varchar](255) NULL,
	[User_Insert] [varchar](100) NULL,
	[User_Update] [varchar](100) NULL,
	[Data_insert] [smalldatetime] NULL,
	[Data_Update] [smalldatetime] NULL,
	[Data_Lettura] [smalldatetime] NULL,
	[LockStatus] [varchar](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRec] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
