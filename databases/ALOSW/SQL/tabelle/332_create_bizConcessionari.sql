/****** Object:  Table [dbo].[bizConcessionari]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bizConcessionari](
	[IdConcessionario] [int] IDENTITY(1,1) NOT NULL,
	[NomeConcessionario] [char](50) NULL,
	[Indirizzo] [char](255) NULL,
	[Cap] [char](6) NULL,
	[Comune] [char](50) NULL,
	[Provincia] [char](2) NULL,
	[Via] [char](120) NULL,
	[Civico] [char](20) NULL,
	[ParToponimo] [int] NULL,
	[Telefono] [char](20) NULL,
	[Telefono2] [char](20) NULL,
	[Fax] [char](20) NULL,
	[Email] [char](100) NULL,
	[TipoRete] [int] NULL,
	[PercFissaRete] [float] NULL,
	[ImportoGiornoRete] [float] NULL,
	[PIVA] [char](30) NULL,
	[Codice] [varchar](6) NULL,
	[BizMacro] [int] NULL,
	[CodGestore] [varchar](20) NULL,
	[NomeConcImp] [varchar](200) NULL,
	[CodFiscale] [varchar](50) NULL,
	[CIG] [varchar](50) NULL,
	[RidDiretto] [bit] NULL,
	[Colore] [int] NULL,
	[DataFine] [smalldatetime] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
