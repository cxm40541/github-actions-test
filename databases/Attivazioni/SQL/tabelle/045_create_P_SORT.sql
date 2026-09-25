/****** Object:  Table [dbo].[P_SORT]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[P_SORT](
	[PROV] [nvarchar](2) NULL,
	[NUM_RICEV] [float] NULL,
	[COMUNE] [nvarchar](25) NULL,
	[CAP] [nvarchar](5) NULL,
	[INDIRIZZO] [nvarchar](40) NULL,
	[COGNOME] [nvarchar](24) NULL,
	[NOME] [nvarchar](20) NULL,
	[STATO] [nvarchar](1) NULL,
	[FLAG_PROVV] [float] NULL,
	[DATA_ATT] [char](10) NULL,
	[DATA_GIOCO] [char](10) NULL,
	[DATA_GEST] [char](10) NULL,
	[id_soggetto] [char](6) NOT NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
CREATE CLUSTERED INDEX [ix_p_sort] ON [dbo].[P_SORT] 
(
	[id_soggetto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
GO
