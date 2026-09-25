/****** Object:  Table [dbo].[lsrent]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrent](
	[lsrent_key_cod_ente] [char](2) NOT NULL,
	[lsrent_descrizione] [char](50) NULL,
	[lsrent_descrizione_breve] [char](20) NULL,
	[lsrent_dipartimento] [char](100) NULL,
	[lsrent_settore] [char](100) NULL,
	[lsrent_ufficio] [char](100) NULL,
	[lsrent_area] [char](100) NULL,
	[lsrent_indirizzo] [char](50) NULL,
	[lsrent_cap] [char](5) NULL,
	[lsrent_citta] [char](50) NULL,
	[lsrent_tel_ufficio] [char](15) NULL,
	[lsrent_fax] [char](15) NULL,
	[lsrent_responsabile] [char](50) NULL,
	[lsrent_mod_riscossione] [char](1) NULL,
 CONSTRAINT [PK_lsrent] PRIMARY KEY NONCLUSTERED 
(
	[lsrent_key_cod_ente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
