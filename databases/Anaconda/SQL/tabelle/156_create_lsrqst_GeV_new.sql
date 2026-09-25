/****** Object:  Table [dbo].[lsrqst_GeV_new]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrqst_GeV_new](
	[lsrqst_GeV_key_id_ricev] [char](7) NOT NULL,
	[lsrqst_GeV_key_data_ins] [char](8) NOT NULL,
	[lsrqst_GeV_key_ora_ins] [char](8) NOT NULL,
	[lsrqst_GeV_cod_lotto] [char](6) NULL,
	[lsrqst_GeV_tipo_esercizio] [char](2) NULL,
	[lsrqst_GeV_tipo_esercizio_note] [varchar](50) NULL,
	[lsrqst_GeV_cat_merc_primaria] [char](2) NULL,
	[lsrqst_GeV_cat_merc_primaria_note] [varchar](50) NULL,
	[lsrqst_GeV_cat_merc_secondaria] [char](2) NULL,
	[lsrqst_GeV_cat_merc_secondaria_note] [varchar](50) NULL,
	[lsrqst_GeV_punto_lottomatica] [char](1) NULL,
	[lsrqst_GeV_punto_Sisal] [char](1) NULL,
	[lsrqst_GeV_punto_Snai] [char](1) NULL,
	[lsrqst_GeV_punto_Lis] [char](1) NULL,
	[lsrqst_GeV_punto_note] [varchar](50) NULL,
	[lsrqst_Gev_associazione] [char](1) NULL,
	[lsrqst_GeV_presenza_lotto] [char](1) NULL,
	[lsrqst_GeV_presenza_superenalotto] [char](1) NULL,
	[lsrqst_GeV_presenza_totocalcio] [char](1) NULL,
	[lsrqst_GeV_presenza_totip] [char](1) NULL,
	[lsrqst_GeV_presenza_ippica] [char](1) NULL,
	[lsrqst_GeV_presenza_scommesse] [char](1) NULL,
	[lsrqst_GeV_presenza_vlt] [char](1) NULL,
	[lsrqst_GeV_presenza_servizi] [char](1) NULL,
	[lsrqst_Gev_prodotti_note] [varchar](50) NULL,
	[lsrqst_GeV_orario] [varchar](50) NULL,
	[lsrqst_GeV_giorno_riposo] [char](1) NULL,
	[lsrqst_GeV_num_vetrine] [varchar](2) NULL,
	[lsrqst_GeV_superficie] [char](2) NULL,
	[lsrqst_GeV_insegna_esterna] [char](1) NULL,
	[lsrqst_GeV_spazio_cliente] [char](2) NULL,
	[lsrqst_GeV_spazio_espositivo] [char](1) NULL,
	[lsrqst_GeV_tv] [char](1) NULL,
	[lsrqst_GeV_pc] [char](1) NULL,
	[lsrqst_GeV_stampante] [char](1) NULL,
	[lsrqst_GeV_internet] [char](1) NULL,
	[lsrqst_GeV_ubicazione] [char](2) NULL,
	[lsrqst_GeV_tipo_zona] [char](2) NULL,
	[lsrqst_GeV_posizione] [char](2) NULL,
	[lsrqst_GeV_tel_prinicipale] [char](12) NULL,
	[lsrqst_GeV_tel_alternativo] [char](12) NULL,
	[lsrqst_GeV_fax] [varchar](12) NULL,
	[lsrqst_GeV_e_mail] [varchar](50) NULL,
 CONSTRAINT [PK_lsrqst_GeV_new] PRIMARY KEY CLUSTERED 
(
	[lsrqst_GeV_key_id_ricev] ASC,
	[lsrqst_GeV_key_data_ins] ASC,
	[lsrqst_GeV_key_ora_ins] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
