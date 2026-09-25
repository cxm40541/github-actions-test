/****** Object:  Table [dbo].[lsrapp]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrapp](
	[lsrapp_key_id_ricev] [char](6) NOT NULL,
	[lsrapp_cod_amm] [char](6) NULL,
	[lsrapp_qta_term] [char](2) NULL,
	[lsrapp_modulo] [char](1) NULL,
	[lsrapp_data_attiv] [char](8) NULL,
	[lsrapp_data_cessaz] [char](8) NULL,
	[lsrapp_decod_ricev] [char](50) NULL,
	[lsrapp_comune_ricev] [char](24) NULL,
	[lsrapp_prov_ricev] [char](2) NULL,
	[lsrapp_cap] [char](5) NULL,
	[lsrapp_indirizzo] [char](40) NULL,
	[lsrapp_cognome] [char](24) NULL,
	[lsrapp_nome] [char](20) NULL,
	[lsrapp_stato] [char](1) NULL,
	[lsrapp_tel_ricevitoria] [char](12) NULL,
	[lsrapp_tel_casa] [char](12) NULL,
	[lsrapp_data_val_provv] [char](8) NULL,
	[lsrapp_tab_giochi_lotto] [char](1) NULL,
	[lsrapp_tab_giochi_f101] [char](1) NULL,
	[lsrapp_tab_giochi_lottotel] [char](1) NULL,
	[lsrapp_tab_giochi_info] [char](1) NULL,
	[lsrapp_tab_giochi_bollo] [char](1) NULL,
	[lsrapp_tab_giochi_biglietteria] [char](1) NULL,
	[lsrapp_tab_giochi_comune] [char](1) NULL,
	[lsrapp_tab_giochi_08] [char](1) NULL,
	[lsrapp_tab_giochi_09] [char](1) NULL,
	[lsrapp_tab_giochi_10] [char](1) NULL,
	[lsrapp_tab_giochi_11] [char](1) NULL,
	[lsrapp_tab_giochi_12] [char](1) NULL,
	[lsrapp_sigla_ic] [char](2) NULL,
	[lsrapp_sigla_reg] [char](2) NULL,
	[lsrapp_chiusura] [char](1) NULL,
	[lsrapp_tab_speciali] [char](1) NULL,
	[lsrapp_codice_magazzino] [char](5) NULL,
	[lsrapp_tab] [char](4) NULL,
	[lsrapp_associazione] [char](1) NULL,
	[lsrapp_flag_commutata] [char](1) NULL,
	[lsrapp_data_mod] [char](8) NULL,
	[lsrapp_data_riattiv] [char](8) NULL,
	[lsrapp_flag_esercizio] [char](1) NULL,
	[lsrapp_term_inst] [char](2) NULL,
 CONSTRAINT [PK_lsrapp] PRIMARY KEY NONCLUSTERED 
(
	[lsrapp_key_id_ricev] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
