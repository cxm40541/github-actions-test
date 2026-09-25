/****** Object:  Table [dbo].[Incassi_Rollback]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Incassi_Rollback](
	[IdIR] [int] IDENTITY(1,1) NOT NULL,
	[Data] [smalldatetime] NULL,
	[FkID] [int] NULL,
	[TableName] [varchar](50) NULL,
	[Operazione] [varchar](200) NULL,
	[OldValues] [varchar](250) NULL,
	[BollettaIncasso] [int] NULL,
	[Sezionale] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdIR] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
