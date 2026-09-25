/****** Object:  Table [dbo].[ADD_AUT_PG_]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADD_AUT_PG_](
	[Id_Invio] [nvarchar](3) NOT NULL,
	[Id_Esito] [nvarchar](1) NOT NULL,
	[Tipo_Servizio] [nvarchar](2) NOT NULL,
	[Tipo_Record] [nvarchar](1) NOT NULL,
	[Ricevitoria] [nvarchar](6) NOT NULL,
	[CF_NV] [nvarchar](16) NOT NULL,
	[CF_V] [nvarchar](16) NOT NULL,
	[Flag_Validazione_1] [nvarchar](1) NOT NULL,
	[Denominazione] [nvarchar](63) NOT NULL,
	[Sigla] [nvarchar](15) NOT NULL,
	[Indirizzo_Fiscale] [nvarchar](35) NOT NULL,
	[Cap_Fiscale] [nvarchar](5) NOT NULL,
	[Comune_Fiscale] [nvarchar](25) NOT NULL,
	[Provincia_Fiscale] [nvarchar](2) NOT NULL,
	[Flag_Validazione_2] [nvarchar](1) NOT NULL,
	[Data_Indirizzo] [nvarchar](8) NOT NULL,
	[Cod_Belfiore] [nvarchar](4) NOT NULL,
	[Data_Cessazione] [nvarchar](8) NOT NULL,
	[Flag_Indirizzo] [nvarchar](1) NOT NULL,
	[Data_Inserimento] [nvarchar](8) NOT NULL,
 CONSTRAINT [PK_ADD_AUT_PG] PRIMARY KEY CLUSTERED 
(
	[Id_Invio] ASC,
	[Id_Esito] ASC,
	[Tipo_Servizio] ASC,
	[Ricevitoria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
