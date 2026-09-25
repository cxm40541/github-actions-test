/****** Object:  Table [dbo].[StoricoContatori]    Script Date: 11/17/2025 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StoricoContatori](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Form] [varchar](100) NULL,
	[User] [varchar](150) NULL,
	[C_old_IN] [float] NULL,
	[C_old_OUT] [float] NULL,
	[C_new_IN] [float] NULL,
	[C_new_OUT] [float] NULL,
	[Data] [smalldatetime] NULL,
	[Dedicato] [int] NULL,
	[Tipo] [int] NULL,
	[Note] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
