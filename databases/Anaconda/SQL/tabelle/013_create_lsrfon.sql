/****** Object:  Table [dbo].[lsrfon]    Script Date: 11/17/2025 15:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrfon](
	[lsrfon_key_tipo] [char](1) NOT NULL,
	[lsrfon_key_fonte] [char](2) NOT NULL,
	[lsrfon_descrizione] [char](50) NULL,
	[lsrfon_descrizione_breve] [char](20) NULL,
 CONSTRAINT [PK_lsrfon] PRIMARY KEY NONCLUSTERED 
(
	[lsrfon_key_tipo] ASC,
	[lsrfon_key_fonte] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
