/****** Object:  Table [dbo].[lsrpck_gev]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrpck_gev](
	[lsrpck_gev_key_codlotteria] [char](4) NOT NULL,
	[lsrpck_gev_prezzo_biglietto] [smallint] NULL,
	[lsrpck_gev_descrizione] [varchar](50) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
