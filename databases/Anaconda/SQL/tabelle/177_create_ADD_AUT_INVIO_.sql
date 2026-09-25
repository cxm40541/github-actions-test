/****** Object:  Table [dbo].[ADD_AUT_INVIO_]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADD_AUT_INVIO_](
	[Id_Invio] [nvarchar](3) NOT NULL,
	[Id_Ente] [nvarchar](4) NOT NULL,
	[Data_Creazione] [nvarchar](8) NOT NULL,
	[Anno_Riferimento] [nvarchar](2) NOT NULL,
	[Cod_Risposta] [nvarchar](5) NOT NULL,
	[Data_Agenzia] [nvarchar](8) NOT NULL,
	[CF_Validati] [int] NOT NULL,
	[CF_Sostituiti] [int] NOT NULL,
	[CF_Recuperati] [int] NOT NULL,
	[CF_Nulli] [int] NOT NULL,
	[Data_Inserimento] [nvarchar](8) NOT NULL,
	[Data_Elaborazione] [nvarchar](8) NOT NULL,
 CONSTRAINT [PK_ADD_AUT_INVIO] PRIMARY KEY CLUSTERED 
(
	[Id_Invio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
