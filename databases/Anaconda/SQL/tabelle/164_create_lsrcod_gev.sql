/****** Object:  Table [dbo].[lsrcod_gev]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrcod_gev](
	[lsrcod_gev_codice] [char](2) NOT NULL,
	[lsrcod_gev_descrizione] [varchar](50) NULL,
 CONSTRAINT [PK_lsrcod_gev] PRIMARY KEY CLUSTERED 
(
	[lsrcod_gev_codice] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
