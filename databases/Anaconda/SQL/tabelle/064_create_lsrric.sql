/****** Object:  Table [dbo].[lsrric]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrric](
	[lsrric_key_id_ricev] [char](6) NOT NULL,
	[lsrric_key_data_ins] [char](8) NOT NULL,
	[lsrric_key_ora_ins] [char](8) NOT NULL,
	[lsrric_cod_amm] [char](6) NOT NULL,
	[lsrric_data_attiv] [char](8) NULL,
	[lsrric_data_cessaz] [char](8) NULL,
	[lsrric_decod_ricev] [char](50) NULL,
	[lsrric_comune_ricev] [char](24) NULL,
	[lsrric_prov_ricev] [char](2) NULL,
	[lsrric_cap] [char](5) NULL,
	[lsrric_indirizzo] [char](40) NULL,
	[lsrric_stato] [char](1) NULL,
	[lsrric_tel_ricevitoria] [char](12) NULL,
	[lsrric_sigla_ic] [char](2) NULL,
	[lsrric_sigla_reg] [char](2) NULL,
	[lsrric_chiusura] [char](1) NULL,
	[lsrric_tab_speciali] [char](1) NULL,
	[lsrric_codice_magazzino] [char](5) NULL,
	[lsrric_data_riattiv] [char](8) NULL,
	[lsrric_flag_esercizio] [char](1) NULL,
	[lsrric_num_terminali] [char](2) NULL,
	[lsrric_id_tab] [char](4) NULL,
	[lsrric_firma] [char](17) NULL,
	[lsrric_stato_attuale] [char](1) NULL,
	[lsrric_data_provv] [char](8) NULL,
	[lsrric_prog_provv] [char](14) NULL,
	[lsrric_tipo_provv] [char](1) NULL,
	[lsrric_data_validita] [char](8) NULL,
	[lsrric_ora_validita] [char](8) NULL,
	[lsrric_flag_validita] [char](1) NULL,
	[lsrric_ft_vos] [char](8) NULL,
 CONSTRAINT [PK_lsrric] PRIMARY KEY CLUSTERED 
(
	[lsrric_key_id_ricev] ASC,
	[lsrric_key_data_ins] ASC,
	[lsrric_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
