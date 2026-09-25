/****** Object:  Table [dbo].[atip_tot_rich]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[atip_tot_rich](
	[lotto] [char](6) NULL,
	[amm] [char](6) NULL,
	[postaz] [char](2) NULL,
	[stato] [char](2) NULL,
	[term] [char](5) NULL,
	[codor] [char](6) NULL,
	[sdlc] [varchar](2) NULL,
	[td] [char](15) NULL,
	[comune] [char](50) NULL,
	[provv] [char](10) NULL,
	[cap] [char](6) NULL,
	[indirizzo] [char](50) NULL,
	[cognome] [char](25) NULL,
	[nome] [char](25) NULL,
	[tel_ric] [char](15) NULL,
	[tel_casa] [char](15) NULL,
	[stamp] [char](8) NULL,
	[borchia_old] [char](2) NULL,
	[td_new] [char](15) NULL,
	[borchia_new] [char](2) NULL,
	[Col021] [varchar](255) NULL,
	[Col022] [varchar](255) NULL,
	[Col023] [varchar](255) NULL,
	[Col024] [varchar](255) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
