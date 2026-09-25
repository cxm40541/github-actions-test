/****** Object:  Table [dbo].[Mobile_Richieste_LOTTO_Storico]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mobile_Richieste_LOTTO_Storico](
	[IdLottoRichieste] [int] IDENTITY(1,1) NOT NULL,
	[PROG_RICHIESTA] [int] NULL,
	[PORTALE_ID] [int] NULL,
	[CODE_ID] [varchar](4000) NULL,
	[ID_RICHIESTA] [varchar](4000) NULL,
	[STATO] [varchar](50) NULL,
	[CNTTOTIN] [varchar](4000) NULL,
	[CNTTOTOT] [varchar](4000) NULL,
	[DATA_INS] [smalldatetime] NULL,
	[DATA_RISP] [smalldatetime] NULL,
	[ERRORE_MED] [varchar](4000) NULL,
	[FLAG_INVIO] [varchar](50) NULL,
	[ESITO_AAMS] [varchar](4000) NULL,
	[TIPO_MESSAGGIO] [varchar](50) NULL,
	[MAC_ADDRESS] [varchar](50) NULL,
	[PROG_APPARECCHIO_ID] [int] NULL,
	[FLAG_MOBILE] [varchar](50) NULL,
	[TIPO_AWP] [int] NULL,
	[VESE] [varchar](50) NULL,
	[StatoInterno] [varchar](50) NULL,
	[StatoFlusso] [varchar](50) NULL,
	[DataRichiesta] [smalldatetime] NULL,
	[ErroreInterno] [varchar](250) NULL,
	[RemoteUserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLottoRichieste] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
