/****** Object:  Table [dbo].[Ric_LogImport]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ric_LogImport](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[BizMacro] [int] NULL,
	[MacroName] [varchar](50) NULL,
	[DataRif] [smalldatetime] NULL,
	[NomeFile] [varchar](255) NULL,
	[Riga] [int] NULL,
	[TipoErrore] [varchar](50) NULL,
	[TipoApp] [varchar](50) NULL,
	[Descr] [varchar](255) NULL,
	[CodiceMobile] [varchar](50) NULL,
	[ModelloMobile] [varchar](50) NULL,
	[MeseAnno] [varchar](50) NULL,
	[Fornitore] [varchar](50) NULL,
	[CodiceScheda] [varchar](50) NULL,
	[ModelloScheda] [varchar](50) NULL,
	[Identificativo] [varchar](50) NULL,
	[AWP] [varchar](50) NULL,
	[CAMBIAMONETE] [varchar](50) NULL,
	[VESE] [varchar](50) NULL,
	[DENOMLOCALE] [varchar](255) NULL,
	[DATARILEVAZIONE] [varchar](100) NULL,
	[OPERATORE] [varchar](100) NULL,
	[GESTORE] [varchar](100) NULL,
	[IdentificativoBck] [varchar](50) NULL,
	[TipoGestore] [varchar](10) NULL,
	[bVerificato] [bit] NULL,
	[Pagina] [varchar](10) NULL,
	[bIdErr] [bit] NULL,
	[bVeseErr] [bit] NULL,
	[Note] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
