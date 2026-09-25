/****** Object:  Table [dbo].[Guasti_VOS]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Guasti_VOS](
	[id_guasto_vos] [char](6) NOT NULL,
	[descr_guasto_vos] [varchar](50) NOT NULL,
	[data_ora_inizio] [datetime] NOT NULL,
	[data_ora_fine] [datetime] NOT NULL,
	[bloccante] [char](2) NOT NULL,
	[sistema] [char](10) NOT NULL,
	[terminali_coinvolti] [int] NULL,
 CONSTRAINT [PK_Guasti_VOS] PRIMARY KEY CLUSTERED 
(
	[id_guasto_vos] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
