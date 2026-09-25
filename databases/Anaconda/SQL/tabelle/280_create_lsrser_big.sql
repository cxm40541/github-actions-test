/****** Object:  Table [dbo].[lsrser_big]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrser_big](
	[lsrser_big_key_id_ricev] [char](6) NOT NULL,
	[lsrser_big_key_data_ins] [char](8) NOT NULL,
	[lsrser_big_key_ora_ins] [char](8) NOT NULL,
	[lsrser_big_key_categoria] [char](2) NOT NULL,
	[lsrser_big_key_servizio] [char](2) NOT NULL,
	[lsrser_big_key_attivita] [char](2) NOT NULL,
	[lsrser_big_stato] [char](1) NOT NULL,
	[lsrser_big_data_decor] [char](8) NOT NULL,
	[lsrser_big_tipo_provv] [char](1) NULL,
	[lsrser_big_data_provv] [char](8) NULL,
	[lsrser_big_prog_provv] [char](14) NULL,
	[lsrser_big_associazione] [char](1) NULL,
	[lsrser_big_firma] [char](17) NULL,
	[lsrser_big_note] [char](150) NULL,
	[lsrser_big_ft_vos] [char](8) NULL,
	[lsrser_big_flag_validita] [char](1) NOT NULL,
 CONSTRAINT [PK_lsrser_big] PRIMARY KEY NONCLUSTERED 
(
	[lsrser_big_key_id_ricev] ASC,
	[lsrser_big_key_data_ins] ASC,
	[lsrser_big_key_ora_ins] ASC,
	[lsrser_big_key_categoria] ASC,
	[lsrser_big_key_servizio] ASC,
	[lsrser_big_key_attivita] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
CREATE CLUSTERED INDEX [IX_lsrser_big] ON [dbo].[lsrser_big] 
(
	[lsrser_big_key_id_ricev] ASC,
	[lsrser_big_key_categoria] ASC,
	[lsrser_big_key_servizio] ASC,
	[lsrser_big_key_attivita] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
GO
