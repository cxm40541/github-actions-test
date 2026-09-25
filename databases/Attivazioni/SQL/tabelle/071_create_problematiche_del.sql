/****** Object:  Table [dbo].[problematiche_del]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[problematiche_del](
	[id_piano] [char](10) NOT NULL,
	[id_soggetto] [char](10) NOT NULL,
	[Progr_problematica] [char](10) NOT NULL,
	[progr_operazione] [int] NOT NULL,
	[cod_problematica] [char](5) NOT NULL,
	[inizio] [datetime] NULL,
	[fine] [datetime] NULL,
	[ora_inizio] [datetime] NULL,
	[ora_fine] [datetime] NULL,
	[note] [char](255) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
