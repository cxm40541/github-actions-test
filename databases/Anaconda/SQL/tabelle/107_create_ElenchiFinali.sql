/****** Object:  Table [dbo].[ElenchiFinali]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ElenchiFinali](
	[Retailer] [varchar](7) NULL,
	[Tsr] [varchar](3) NULL,
	[Classe] [varchar](3) NULL,
	[Frequenza] [int] NULL,
	[CallDay] [int] NULL,
	[RetailerStatus] [varchar](20) NULL,
	[SalesAllowed] [varchar](20) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
