/****** Object:  Table [dbo].[lsrgio]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrgio](
	[lsrgio_codice_gioco] [char](2) NOT NULL,
	[lsrgio_nome_gioco] [char](20) NOT NULL,
 CONSTRAINT [PK_lsrgio] PRIMARY KEY NONCLUSTERED 
(
	[lsrgio_codice_gioco] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
