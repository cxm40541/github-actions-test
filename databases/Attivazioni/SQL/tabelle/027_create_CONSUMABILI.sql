/****** Object:  Table [dbo].[CONSUMABILI]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CONSUMABILI](
	[terminale] [char](7) NOT NULL,
	[data_1] [char](10) NOT NULL,
	[data_2] [char](10) NOT NULL,
	[data_3] [char](10) NOT NULL,
	[data_4] [char](10) NOT NULL,
	[scontrini_tra_1_e_2] [int] NULL,
	[scontrini_tra_2_e_3] [int] NULL,
	[scontrini_tra_3_e_4] [int] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
