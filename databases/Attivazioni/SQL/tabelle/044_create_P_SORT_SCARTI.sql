/****** Object:  Table [dbo].[P_SORT_SCARTI]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[P_SORT_SCARTI](
	[PROV] [nvarchar](2) NULL,
	[NUM_RICEV] [char](2) NULL,
	[COMUNE] [nvarchar](25) NULL,
	[CAP] [nvarchar](5) NULL,
	[INDIRIZZO] [nvarchar](40) NULL,
	[COGNOME] [nvarchar](24) NULL,
	[NOME] [nvarchar](20) NULL,
	[STATO] [nvarchar](1) NULL,
	[FLAG_PROVV] [char](1) NULL,
	[DATA_ATT] [char](10) NULL,
	[DATA_GIOCO] [char](10) NULL,
	[DATA_GEST] [char](10) NULL,
	[id_soggetto] [char](6) NOT NULL,
	[Descrizione_Scarto] [char](300) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
