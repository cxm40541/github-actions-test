/****** Object:  Table [dbo].[lsrchi]    Script Date: 11/17/2025 15:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrchi](
	[lsrchi_key_id_ricev] [char](6) NOT NULL,
	[lsrchi_key_id_ricev_ferie] [char](6) NOT NULL,
	[lsrchi_key_data_inizio] [char](8) NOT NULL,
	[lsrchi_data_fine] [char](8) NULL,
	[lsrchi_data_ins] [char](8) NULL,
	[lsrchi_firma] [char](17) NULL,
	[lsrchi_causale] [char](2) NULL,
	[lsrchi_uff_ente] [char](2) NULL,
	[lsrchi_uff_sigla_prov] [char](2) NULL,
	[lsrchi_uff_prog_prov] [char](1) NULL,
	[lsrchi_ora_ins] [char](8) NULL,
	[lsrchi_millennio] [char](1) NULL,
 CONSTRAINT [PK_lsrchi] PRIMARY KEY NONCLUSTERED 
(
	[lsrchi_key_id_ricev] ASC,
	[lsrchi_key_id_ricev_ferie] ASC,
	[lsrchi_key_data_inizio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
