/****** Object:  Table [dbo].[aloLicKey]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[aloLicKey](
	[IdK] [int] IDENTITY(1,1) NOT NULL,
	[ProdName] [varchar](80) NULL,
	[ProdCode] [varchar](30) NULL,
	[ProdParam] [varchar](80) NULL,
	[Code] [varchar](50) NULL,
	[DataExpire] [varchar](20) NULL,
	[DataIssue] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
