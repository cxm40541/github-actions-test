/****** Object:  Table [dbo].[COLLEGAMENTI_TERMINALI_IP_SDLCold]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COLLEGAMENTI_TERMINALI_IP_SDLCold](
	[RUOTA] [char](20) NULL,
	[HOST] [char](3) NULL,
	[PROV_RUO] [char](2) NULL,
	[MODULO] [char](1) NULL,
	[NUM_RICEV] [char](9) NULL,
	[PROV_RICEV] [char](2) NULL,
	[ID_AMMINISTRATIVO] [char](6) NULL,
	[ID_LOTTOMATICA] [char](6) NULL,
	[PROGR_TERMINALE] [char](1) NULL,
	[NTER] [char](7) NOT NULL,
	[TITOLARE] [char](50) NULL,
	[COMUNE_RICEV] [char](24) NULL,
	[PROV] [char](2) NULL,
	[CAP] [char](5) NULL,
	[INDIRIZZO] [char](40) NULL,
	[STATO] [char](1) NULL,
	[TEL_RICEVITORIA] [char](12) NULL,
	[TEL_CASA] [char](12) NULL,
	[CODICE_MAGAZZINO] [char](5) NULL,
	[MATRICOLA] [char](11) NULL,
	[FEP_IP] [char](4) NULL,
	[CODOR_IP] [char](5) NULL,
	[SDLC_IP] [char](2) NULL,
	[TD_IP] [char](13) NULL,
	[TIPO_T_IP] [char](4) NULL,
	[N_VERDE_IP] [char](16) NULL,
	[N_VERDE2_IP] [char](16) NULL,
	[N_VERDE_ISDN_B] [char](11) NULL,
	[IP_TERM] [char](15) NULL,
	[IP_HOST] [char](15) NULL,
	[IP_FTP] [char](15) NULL,
	[FEP_SDLC] [char](4) NULL,
	[CODOR_SDLC] [char](5) NULL,
	[SDLC_SDLC] [char](2) NULL,
	[TD_SDLC] [char](13) NULL,
	[TIPO_T_SDLC] [char](4) NULL,
	[N_VERDE_SDLC] [char](16) NULL,
	[N_VERDE2_SDLC] [char](16) NULL,
	[NUAT] [char](15) NULL,
	[PORTA_T] [char](15) NULL,
	[TGU_T] [char](13) NULL,
	[NODO_T] [char](15) NULL,
	[TDH] [char](11) NULL,
	[NUAH] [char](8) NULL,
	[PORTA_H] [char](15) NULL,
	[TGU_H] [char](12) NULL,
	[NODO_H] [char](15) NULL,
	[TD] [char](15) NULL,
	[BORCHIA] [char](5) NULL,
 CONSTRAINT [PK_may] PRIMARY KEY CLUSTERED 
(
	[NTER] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
