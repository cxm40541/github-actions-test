/****** Object:  Table [dbo].[lsrpvc]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrpvc](
	[lsrpvc_key_id_ricev] [char](6) NOT NULL,
	[lsrpvc_data_ins] [char](8) NOT NULL,
	[lsrpvc_ora_ins] [char](8) NOT NULL,
	[lsrpvc_fk_data_ins_nuo] [char](8) NOT NULL,
	[lsrpvc_fk_ora_ins_nuo] [char](8) NOT NULL,
	[lsrpvc_data_crea_file] [char](8) NULL,
	[lsrpvc_tipo_rec] [char](1) NULL,
	[lsrpvc_prog_invio] [int] NULL,
 CONSTRAINT [PK_lsrpvc] PRIMARY KEY CLUSTERED 
(
	[lsrpvc_key_id_ricev] ASC,
	[lsrpvc_fk_data_ins_nuo] ASC,
	[lsrpvc_fk_ora_ins_nuo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
