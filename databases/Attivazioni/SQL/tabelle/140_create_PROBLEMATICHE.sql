/****** Object:  Table [dbo].[PROBLEMATICHE]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROBLEMATICHE](
	[id_piano] [char](10) NOT NULL,
	[id_soggetto] [char](10) NOT NULL,
	[Progr_problematica] [char](10) NOT NULL,
	[progr_operazione] [int] NOT NULL,
	[cod_problematica] [char](5) NOT NULL,
	[inizio] [datetime] NULL,
	[fine] [datetime] NULL,
	[ora_inizio] [datetime] NULL,
	[ora_fine] [datetime] NULL,
	[note] [char](255) NULL,
 CONSTRAINT [PK_PROBLEMATICHE] PRIMARY KEY CLUSTERED 
(
	[id_piano] ASC,
	[id_soggetto] ASC,
	[Progr_problematica] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
