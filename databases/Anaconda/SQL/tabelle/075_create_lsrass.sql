/****** Object:  Table [dbo].[lsrass]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrass](
	[lsrass_key_cod_ass] [char](2) NOT NULL,
	[lsrass_descrizione] [char](30) NULL,
	[lsrass_descr_breve] [char](15) NULL,
	[lsrass_indirizzo] [char](40) NULL,
	[lsrass_cap] [char](5) NULL,
	[lsrass_citta] [char](24) NULL,
	[lsrass_telefono_ufficio] [char](12) NULL,
	[lsrass_numero_fax] [char](12) NULL,
	[lsrass_responsabile] [char](50) NULL,
 CONSTRAINT [PK_lsrass] PRIMARY KEY NONCLUSTERED 
(
	[lsrass_key_cod_ass] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
