/****** Object:  Table [dbo].[CAMBIA_Eventi]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CAMBIA_Eventi](
	[Pk] [int] IDENTITY(1,1) NOT NULL,
	[sn] [varchar](80) NULL,
	[vendor] [varchar](80) NULL,
	[eventCode] [int] NULL,
	[vendorCode] [varchar](80) NULL,
	[eventDate] [smalldatetime] NULL,
	[operator] [varchar](80) NULL,
	[description] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[Pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
