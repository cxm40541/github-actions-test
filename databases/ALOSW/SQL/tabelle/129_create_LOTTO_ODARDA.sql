/****** Object:  Table [dbo].[LOTTO_ODARDA]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOTTO_ODARDA](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdentificativoProv] [varchar](50) NULL,
	[ODAMobile] [varchar](50) NULL,
	[RDAMobile] [varchar](50) NULL,
	[ODAScheda] [varchar](50) NULL,
	[RDAScheda] [varchar](50) NULL,
	[DataMod] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
