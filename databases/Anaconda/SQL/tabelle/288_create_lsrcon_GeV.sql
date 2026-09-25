/****** Object:  Table [dbo].[lsrcon_GeV]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrcon_GeV](
	[lsrcon_GeV_key_id_ricev] [char](7) NOT NULL,
	[lsrcon_GeV_key_data_ins] [char](8) NOT NULL,
	[lsrcon_GeV_key_ora_ins] [char](8) NOT NULL,
	[lsrcon_GeV_cod_lotto] [char](6) NULL,
	[lsrcon_GeV_cod_amm] [char](6) NULL,
	[lsrcon_GeV_tipo_acq] [char](1) NULL,
	[lsrcon_GeV_data_documento] [char](8) NULL,
	[lsrcon_GeV_data_invio_doc] [char](8) NULL,
	[lsrcon_GeV_num_prot_doc] [char](25) NULL,
	[lsrcon_GeV_associazione] [char](1) NULL,
	[lsrcon_GeV_cognome] [char](24) NULL,
	[lsrcon_GeV_nome] [char](20) NULL,
	[lsrcon_GeV_comune_residenza] [char](24) NULL,
	[lsrcon_GeV_provincia_residenza] [char](2) NULL,
	[lsrcon_GeV_cap_residenza] [char](5) NULL,
	[lsrcon_GeV_indirizzo_residenza] [char](40) NULL,
	[lsrcon_GeV_comune_spedizione] [char](24) NULL,
	[lsrcon_GeV_provincia_spedizione] [char](2) NULL,
	[lsrcon_GeV_cap_spedizione] [char](5) NULL,
	[lsrcon_GeV_indirizzo_spedizione] [char](40) NULL,
	[lsrcon_GeV_referente_spedizione] [char](44) NULL,
	[lsrcon_GeV_telefono] [char](12) NULL,
	[lsrcon_GeV_cod_fisc] [char](16) NULL,
	[lsrcon_GeV_partita_iva] [char](11) NULL,
	[lsrcon_GeV_comune] [char](24) NULL,
	[lsrcon_GeV_provincia] [char](2) NULL,
	[lsrcon_GeV_cap] [char](5) NULL,
	[lsrcon_GeV_indirizzo] [char](40) NULL,
	[lsrcon_gev_numero_pacchi] [varchar](10) NULL,
	[lsrcon_GeV_note] [char](100) NULL,
	[lsrcon_Gev_cod_merce] [char](2) NULL,
	[lsrcon_Gev_email] [varchar](100) NULL,
	[lsrcon_Gev_flag_nuovo_con] [char](1) NULL,
	[lsrcon_Gev_data_nuovo_con] [char](8) NULL,
	[lsrcon_GeV_flag_anag] [char](1) NULL,
	[lsrcon_GeV_fk_data_ins_tit] [char](8) NULL,
	[lsrcon_GeV_fk_ora_ins_tit] [char](8) NULL,
	[lsrcon_GeV_fk_data_ins_tit_gev] [char](8) NULL,
	[lsrcon_GeV_fk_ora_ins_tit_gev] [char](8) NULL,
	[lsrcon_GeV_firma] [char](17) NULL,
 CONSTRAINT [PK_lsrcon_GeV] PRIMARY KEY CLUSTERED 
(
	[lsrcon_GeV_key_id_ricev] ASC,
	[lsrcon_GeV_key_data_ins] ASC,
	[lsrcon_GeV_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
