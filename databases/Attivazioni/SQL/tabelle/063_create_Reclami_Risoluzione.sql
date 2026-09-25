/****** Object:  Table [dbo].[Reclami_Risoluzione]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reclami_Risoluzione](
	[descr_risoluzione] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Reclami_Risoluzione] PRIMARY KEY CLUSTERED 
(
	[descr_risoluzione] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
