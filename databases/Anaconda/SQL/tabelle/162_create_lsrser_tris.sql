/****** Object:  Table [dbo].[lsrser_tris]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrser_tris](
	[lsrser_tris_key_id_ricev] [char](6) NOT NULL,
	[lsrser_tris_key_data_ins] [char](8) NOT NULL,
	[lsrser_tris_key_ora_ins] [char](8) NOT NULL,
	[lsrser_tris_stato] [char](1) NOT NULL,
	[lsrser_tris_data_decor] [char](8) NOT NULL,
	[lsrser_tris_tipo_provv] [char](1) NULL,
	[lsrser_tris_data_provv] [char](8) NULL,
	[lsrser_tris_prog_provv] [char](14) NULL,
	[lsrser_tris_associazione] [char](1) NULL,
	[lsrser_tris_firma] [char](17) NULL,
	[lsrser_tris_note] [char](150) NULL,
	[lsrser_tris_ft_vos] [char](8) NULL,
	[lsrser_tris_flag_validita] [char](1) NOT NULL,
 CONSTRAINT [PK_lsrser_tris] PRIMARY KEY CLUSTERED 
(
	[lsrser_tris_key_id_ricev] ASC,
	[lsrser_tris_key_data_ins] ASC,
	[lsrser_tris_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
