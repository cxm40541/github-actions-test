/****** Object:  Table [dbo].[SOGEI_IN]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SOGEI_IN](
	[ric] [char](6) NULL,
	[cognome] [char](24) NULL,
	[nome] [char](20) NULL,
	[cfisc] [char](16) NULL,
	[comune] [char](24) NULL,
	[prov] [char](2) NULL,
	[indir] [char](40) NULL,
	[cap] [char](5) NULL,
	[stipula] [char](8) NULL,
	[cessazione] [char](8) NULL,
	[dataelab] [char](8) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
