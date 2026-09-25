/****** Object:  Table [dbo].[Reclami_Soluzione]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reclami_Soluzione](
	[id_competenza] [char](2) NOT NULL,
	[id_guasto] [char](2) NOT NULL,
	[id_soluzione] [char](2) NOT NULL,
	[descr_soluzione] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Reclami_Soluzione] PRIMARY KEY CLUSTERED 
(
	[id_competenza] ASC,
	[id_guasto] ASC,
	[id_soluzione] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
