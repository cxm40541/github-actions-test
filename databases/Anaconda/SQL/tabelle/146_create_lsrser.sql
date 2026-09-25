/****** Object:  Table [dbo].[lsrser]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrser](
	[lsrser_key_codice_servizio] [char](2) NOT NULL,
	[lsrser_descrizione] [char](20) NULL,
 CONSTRAINT [PK_lsrser] PRIMARY KEY NONCLUSTERED 
(
	[lsrser_key_codice_servizio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
