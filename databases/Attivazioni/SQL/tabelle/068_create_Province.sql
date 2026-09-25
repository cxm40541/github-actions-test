/****** Object:  Table [dbo].[Province]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Province](
	[sig_prov] [char](2) NOT NULL,
	[sig_prov_old] [char](2) NOT NULL,
	[provincia] [char](18) NOT NULL,
	[ista_pr] [char](3) NOT NULL,
	[ista_pr_old] [char](3) NOT NULL,
	[cez] [char](2) NOT NULL,
	[ruota] [char](8) NOT NULL,
	[ista_reg] [char](2) NOT NULL,
	[regione] [char](22) NOT NULL,
	[ista_geog] [char](1) NOT NULL,
	[area] [char](10) NOT NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
