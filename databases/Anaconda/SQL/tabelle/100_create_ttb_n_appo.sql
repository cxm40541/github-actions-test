/****** Object:  Table [dbo].[ttb_n_appo]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ttb_n_appo](
	[key_id_ricev] [varchar](6) NOT NULL,
	[cod_amm] [varchar](6) NULL,
	[qta_term] [varchar](2) NULL,
	[modulo] [varchar](1) NULL,
	[data_attiv] [varchar](8) NULL,
	[data_cessaz] [varchar](8) NULL,
	[decod_ricev] [varchar](50) NULL,
	[comune_ricev] [varchar](24) NULL,
	[prov_ricev] [varchar](2) NULL,
	[cap] [varchar](5) NULL,
	[indirizzo] [varchar](40) NULL,
	[cognome] [varchar](24) NULL,
	[nome] [varchar](20) NULL,
	[stato] [varchar](1) NULL,
	[tel_ricevitoria] [varchar](12) NULL,
	[tel_casa] [varchar](12) NULL,
	[data_val_provv] [varchar](8) NULL,
	[lotto] [varchar](1) NULL,
	[f101] [varchar](1) NULL,
	[lottotel] [varchar](1) NULL,
	[info] [varchar](1) NULL,
	[bollo] [varchar](1) NULL,
	[biglietteria] [varchar](1) NULL,
	[comune] [varchar](1) NULL,
	[tris] [varchar](1) NULL,
	[gev] [varchar](1) NULL,
	[cu] [varchar](1) NULL,
	[coni] [varchar](1) NULL,
	[giochi_12] [varchar](1) NULL,
	[sigla_ic] [varchar](2) NULL,
	[sigla_reg] [varchar](2) NULL,
	[chiusura] [varchar](1) NULL,
	[tab_speciali] [varchar](1) NULL,
	[codice_magazzino] [varchar](5) NULL,
	[tab] [varchar](4) NULL,
	[associazione] [varchar](1) NULL,
	[flag_commutata] [varchar](1) NULL,
	[data_mod] [varchar](8) NULL,
	[data_riattiv] [varchar](8) NULL,
	[flag_esercizio] [varchar](1) NULL,
	[term_inst] [varchar](2) NULL,
 CONSTRAINT [PK_ttb_n_appo] PRIMARY KEY CLUSTERED 
(
	[key_id_ricev] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
