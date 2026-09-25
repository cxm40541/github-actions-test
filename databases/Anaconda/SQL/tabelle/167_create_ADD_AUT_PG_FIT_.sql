/****** Object:  Table [dbo].[ADD_AUT_PG_FIT_]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADD_AUT_PG_FIT_](
	[Ricevitoria] [varchar](250) NOT NULL,
	[Data_Invio] [varchar](14) NOT NULL,
	[Codice_Fiscale] [varchar](250) NOT NULL,
	[Denominazione] [varchar](250) NOT NULL,
	[Sigla] [varchar](250) NOT NULL,
	[Data_Elaborazione] [varchar](8) NOT NULL,
	[Tipo_Servizio] [varchar](2) NOT NULL,
	[Scarto] [varchar](1) NOT NULL,
	[Data_Inserimento] [varchar](8) NOT NULL,
 CONSTRAINT [PK_ADD_AUT_PG_FIT] PRIMARY KEY CLUSTERED 
(
	[Ricevitoria] ASC,
	[Data_Invio] ASC,
	[Tipo_Servizio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
