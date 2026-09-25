/****** Object:  Table [dbo].[lsr1app]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsr1app](
	[lsr1app_key_id_ricev] [char](6) NOT NULL,
	[lsr1app_cod_amm] [char](6) NULL,
	[lsr1app_qta_term] [char](2) NULL,
	[lsr1app_modulo] [char](1) NULL,
	[lsr1app_data_attiv] [char](8) NULL,
	[lsr1app_data_cessaz] [char](8) NULL,
	[lsr1app_decod_ricev] [char](50) NULL,
	[lsr1app_comune_ricev] [char](24) NULL,
	[lsr1app_prov_ricev] [char](2) NULL,
	[lsr1app_cap] [char](5) NULL,
	[lsr1app_indirizzo] [char](40) NULL,
	[lsr1app_cognome] [char](24) NULL,
	[lsr1app_nome] [char](20) NULL,
	[lsr1app_stato] [char](1) NULL,
	[lsr1app_tel_ricevitoria] [char](12) NULL,
	[lsr1app_tel_casa] [char](12) NULL,
	[lsr1app_data_val_provv] [char](8) NULL,
	[lsr1app_tab_giochi_lotto] [char](1) NULL,
	[lsr1app_tab_giochi_f101] [char](1) NULL,
	[lsr1app_tab_giochi_lottotel] [char](1) NULL,
	[lsr1app_tab_giochi_info] [char](1) NULL,
	[lsr1app_tab_giochi_bollo] [char](1) NULL,
	[lsr1app_tab_giochi_biglietteria] [char](1) NULL,
	[lsr1app_tab_giochi_comune] [char](1) NULL,
	[lsr1app_tab_giochi_tris] [char](1) NULL,
	[lsr1app_tab_giochi_09] [char](1) NULL,
	[lsr1app_tab_giochi_10] [char](1) NULL,
	[lsr1app_tab_giochi_11] [char](1) NULL,
	[lsr1app_tab_giochi_12] [char](1) NULL,
	[lsr1app_filler] [char](4) NULL,
	[lsr1app_sigla_ic] [char](2) NULL,
	[lsr1app_sigla_reg] [char](2) NULL,
	[lsr1app_chiusura] [char](1) NULL,
	[lsr1app_tab_speciali] [char](1) NULL,
	[lsr1app_filler2] [char](1) NULL,
	[lsr1app_codice_magazzino] [char](5) NULL,
	[lsr1app_tab] [char](4) NULL,
	[lsr1app_associazione] [char](1) NULL,
	[lsr1app_flag_commutata] [char](1) NULL,
	[lsr1app_data_mod] [char](8) NULL,
	[lsr1app_data_riattiv] [char](8) NULL,
	[lsr1app_flag_esercizio] [char](1) NULL,
	[lsr1app_term_inst] [char](2) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
