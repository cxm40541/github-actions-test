/****** Object:  Table [dbo].[ADD_AUT_CFPF_SCARTI]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADD_AUT_CFPF_SCARTI](
	[CodLotto] [varchar](50) NULL,
	[CodFiscCC] [varchar](50) NULL,
	[Cognome] [varchar](50) NULL,
	[Nome] [varchar](50) NULL,
	[Sesso] [varchar](50) NULL,
	[ComuneNasc] [varchar](50) NULL,
	[ProvinciaNasc] [varchar](50) NULL,
	[Giorno] [varchar](50) NULL,
	[Mese] [varchar](50) NULL,
	[Anno] [varchar](50) NULL,
	[Provenienza] [varchar](50) NULL,
	[DataInserimento] [datetime] NULL,
	[Motivo] [varchar](300) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
