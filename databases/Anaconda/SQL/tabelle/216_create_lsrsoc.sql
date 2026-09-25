/****** Object:  Table [dbo].[lsrsoc]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrsoc](
	[lsrsoc_key_id_soc] [char](2) NOT NULL,
	[lsrsoc_descrizione] [char](100) NULL,
 CONSTRAINT [PK_lsrsoc] PRIMARY KEY NONCLUSTERED 
(
	[lsrsoc_key_id_soc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
