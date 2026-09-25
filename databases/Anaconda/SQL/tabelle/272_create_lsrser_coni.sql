/****** Object:  Table [dbo].[lsrser_coni]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrser_coni](
	[lsrser_coni_key_id_ricev] [char](6) NOT NULL,
	[lsrser_coni_key_data_ins] [char](8) NOT NULL,
	[lsrser_coni_key_ora_ins] [char](8) NOT NULL,
	[lsrser_coni_stato] [char](1) NULL,
	[lsrser_coni_data_decor] [char](8) NULL,
	[lsrser_coni_tipo_provv] [char](1) NULL,
	[lsrser_coni_data_provv] [char](8) NULL,
	[lsrser_coni_prog_provv] [char](14) NULL,
	[lsrser_coni_firma] [char](17) NULL,
	[lsrser_coni_note] [char](150) NULL,
	[lsrser_coni_ft_vos] [char](8) NULL,
	[lsrser_coni_flag_validita] [char](1) NULL,
 CONSTRAINT [PK_lsrser_coni] PRIMARY KEY NONCLUSTERED 
(
	[lsrser_coni_key_id_ricev] ASC,
	[lsrser_coni_key_data_ins] ASC,
	[lsrser_coni_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
