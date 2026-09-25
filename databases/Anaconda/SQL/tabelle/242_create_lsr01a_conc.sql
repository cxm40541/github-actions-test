/****** Object:  Table [dbo].[lsr01a_conc]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsr01a_conc](
	[lsr01a_key_id_ricev] [char](6) NOT NULL,
	[lsr01a_cod_amm] [char](6) NULL,
	[lsr01a_qta_term] [char](2) NULL,
	[lsr01a_modulo] [char](1) NULL,
	[lsr01a_data_attiv] [char](8) NULL,
	[lsr01a_data_cessaz] [char](8) NULL,
	[lsr01a_decod_ricev] [char](50) NULL,
	[lsr01a_comune_ricev] [char](24) NULL,
	[lsr01a_prov_ricev] [char](2) NULL,
	[lsr01a_cap] [char](5) NULL,
	[lsr01a_indirizzo] [char](40) NULL,
	[lsr01a_cognome] [char](24) NULL,
	[lsr01a_nome] [char](20) NULL,
	[lsr01a_stato] [char](1) NULL,
	[lsr01a_tel_ricevitoria] [char](12) NULL,
	[lsr01a_tel_casa] [char](12) NULL,
	[lsr01a_data_val_provv] [char](8) NULL,
	[lsr01a_tab_giochi_lotto] [char](1) NULL,
	[lsr01a_tab_giochi_f101] [char](1) NULL,
	[lsr01a_tab_giochi_rai] [char](1) NULL,
	[lsr01a_tab_giochi_info] [char](1) NULL,
	[lsr01a_tab_giochi_bollo] [char](1) NULL,
	[lsr01a_tab_giochi_biglietteria] [char](1) NULL,
	[lsr01a_tab_giochi_comune] [char](1) NULL,
	[lsr01a_tab_giochi_tris] [char](1) NULL,
	[lsr01a_tab_giochi_09] [char](1) NULL,
	[lsr01a_tab_giochi_10] [char](1) NULL,
	[lsr01a_tab_giochi_11] [char](1) NULL,
	[lsr01a_tab_giochi_12] [char](1) NULL,
	[lsr01a_filler] [char](4) NULL,
	[lsr01a_sigla_ic] [char](2) NULL,
	[lsr01a_sigla_reg] [char](2) NULL,
	[lsr01a_chiusura] [char](1) NULL,
	[lsr01a_tab_speciali] [char](1) NULL,
	[lsr01a_filler2] [char](1) NULL,
	[lsr01a_codice_magazzino] [char](5) NULL,
	[lsr01a_tab] [char](4) NULL,
	[lsr01a_associazione] [char](1) NULL,
	[lsr01a_flag_commutata] [char](1) NULL,
	[lsr01a_data_mod] [char](8) NULL,
	[lsr01a_data_riattiv] [char](8) NULL,
	[lsr01a_flag_esercizio] [char](1) NULL,
	[lsr01a_term_inst] [char](2) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
