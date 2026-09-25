/****** Object:  Table [dbo].[Reclami]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Reclami](
	[id_reclamo] [int] NULL,
	[id_soluzione] [char](2) NULL,
	[id_guasto] [char](2) NULL,
	[id_competenza] [char](2) NULL,
	[data_protocollo] [datetime] NULL,
	[data_apertura_guasto] [datetime] NULL,
	[data_chiusura_guasto] [datetime] NULL,
	[data_chiusura_scheda] [datetime] NULL,
	[mese_riferimento] [char](2) NULL,
	[id_pv] [char](7) NULL,
	[cognome] [varchar](50) NULL,
	[nome] [varchar](50) NULL,
	[indirizzo] [varchar](100) NULL,
	[comune] [varchar](50) NULL,
	[provincia] [char](2) NULL,
	[telefono] [varchar](50) NULL,
	[modello_terminale] [varchar](50) NULL,
	[tipo_contratto] [varchar](50) NULL,
	[tipo_linea] [varchar](50) NULL,
	[data_inserimento] [datetime] NULL,
	[risoluzione] [varchar](50) NULL,
	[anno_riferimento] [int] NULL,
	[Data_Assegnazione_Protocollo] [datetime] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
