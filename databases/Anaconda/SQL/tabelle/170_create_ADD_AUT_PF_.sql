/****** Object:  Table [dbo].[ADD_AUT_PF_]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADD_AUT_PF_](
	[Id_Invio] [nvarchar](3) NOT NULL,
	[Id_Esito] [nvarchar](1) NOT NULL,
	[Tipo_Servizio] [nvarchar](2) NOT NULL,
	[Tipo_Record] [nvarchar](1) NOT NULL,
	[Ricevitoria] [nvarchar](6) NOT NULL,
	[CF_NV] [nvarchar](16) NOT NULL,
	[CF_V] [nvarchar](16) NOT NULL,
	[Flag_Validazione_1] [nvarchar](1) NOT NULL,
	[Cognome] [nvarchar](24) NOT NULL,
	[Nome] [nvarchar](20) NOT NULL,
	[Sesso] [nvarchar](1) NOT NULL,
	[Anno_Nascita] [nvarchar](2) NOT NULL,
	[Mese_Nascita] [nvarchar](2) NOT NULL,
	[Giorno_Nascita] [nvarchar](2) NOT NULL,
	[Comune_Nascita] [nvarchar](25) NOT NULL,
	[Provincia_Nascita] [nvarchar](2) NOT NULL,
	[Indirizzo_Res] [nvarchar](35) NOT NULL,
	[Cap_Res] [nvarchar](5) NOT NULL,
	[Comune_Res] [nvarchar](25) NOT NULL,
	[Provincia_Res] [nvarchar](2) NOT NULL,
	[Anno_Nascita2] [nvarchar](4) NOT NULL,
	[Flag_Validazione_2] [nvarchar](1) NOT NULL,
	[Data_Indirizzo_Res] [nvarchar](8) NOT NULL,
	[Flag_Decesso] [nvarchar](1) NOT NULL,
	[Data_Decesso] [nvarchar](7) NOT NULL,
	[Fonte_Decesso] [nvarchar](1) NOT NULL,
	[Cod_Belfiore] [nvarchar](4) NOT NULL,
	[Flag_Indirizzo_Res] [nvarchar](1) NOT NULL,
	[Data_Inserimento] [nvarchar](8) NOT NULL,
 CONSTRAINT [PK_ADD_AUT_PF] PRIMARY KEY CLUSTERED 
(
	[Id_Invio] ASC,
	[Id_Esito] ASC,
	[Tipo_Servizio] ASC,
	[Ricevitoria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
