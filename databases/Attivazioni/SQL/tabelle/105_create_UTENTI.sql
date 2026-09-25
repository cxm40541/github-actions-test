/****** Object:  Table [dbo].[UTENTI]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UTENTI](
	[id_utente] [char](5) NOT NULL,
	[login] [char](10) NOT NULL,
	[password] [char](10) NOT NULL,
	[nome_e_cognome] [char](50) NOT NULL,
	[livello] [char](2) NULL,
 CONSTRAINT [PK_UTENTI] PRIMARY KEY CLUSTERED 
(
	[login] ASC,
	[password] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
