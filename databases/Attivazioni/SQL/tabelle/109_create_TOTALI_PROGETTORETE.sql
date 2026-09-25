/****** Object:  Table [dbo].[TOTALI_PROGETTORETE]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TOTALI_PROGETTORETE](
	[ruota] [varchar](13) NOT NULL,
	[fep] [smallint] NULL,
	[dorsali] [int] NULL,
	[coll_ter] [int] NULL,
	[rice_coll] [int] NULL,
	[riceatt_coll] [int] NULL,
	[ricenoatt_coll] [int] NULL,
	[ricesosp_coll] [int] NULL,
	[ricerevo_coll] [int] NULL,
	[ricesma_coll] [int] NULL,
	[coll_teratt] [int] NULL,
	[coll_ternoatt] [int] NULL,
	[giorno] [smalldatetime] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
