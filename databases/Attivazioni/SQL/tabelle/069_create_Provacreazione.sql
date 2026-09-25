/****** Object:  Table [dbo].[Provacreazione]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Provacreazione](
	[data_rif] [datetime] NULL,
	[flag_data] [char](1) NULL,
	[gruppo_chiusura] [varchar](35) NULL,
	[tripla] [varchar](200) NULL,
	[tipo_problema1] [varchar](50) NULL,
	[tipo_problema2] [varchar](50) NULL,
	[ricevitoria] [char](10) NULL,
	[id_ticket] [int] NULL,
	[flag_ripetitivo] [char](20) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
