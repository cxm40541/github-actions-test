/****** Object:  Table [dbo].[lsrgio_GeV]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrgio_GeV](
	[lsrgio_gev_key_id] [char](4) NOT NULL,
	[lsrgio_gev_descrizione] [varchar](50) NOT NULL,
 CONSTRAINT [PK_lsrgio_GeV] PRIMARY KEY CLUSTERED 
(
	[lsrgio_gev_key_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
