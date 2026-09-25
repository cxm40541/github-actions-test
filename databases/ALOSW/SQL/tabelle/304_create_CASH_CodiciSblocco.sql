/****** Object:  Table [dbo].[CASH_CodiciSblocco]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CASH_CodiciSblocco](
	[IdCodice] [int] IDENTITY(1,1) NOT NULL,
	[DataCreazione] [smalldatetime] NULL,
	[FkUser] [int] NULL,
	[Annullato] [bit] NULL,
	[CodiceRichiesta] [varchar](20) NULL,
	[CodiceSblocco] [varchar](50) NULL,
	[SubCode] [varchar](20) NULL,
	[FkUserRemote] [int] NULL,
	[Funzione] [varchar](100) NULL,
	[FkLocale] [int] NULL,
	[FkEsattore] [int] NULL,
	[FkApparecchio] [int] NULL,
	[Etichetta] [varchar](150) NULL,
	[Importo] [float] NULL,
	[IPNumber] [varchar](20) NULL,
	[DeviceVersion] [varchar](20) NULL,
	[DeviceSerial] [varchar](80) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCodice] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
