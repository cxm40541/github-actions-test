/****** Object:  Table [dbo].[MagRicambiLotto]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MagRicambiLotto](
	[IdRicambio] [int] IDENTITY(1,1) NOT NULL,
	[CostruttoreName] [varchar](100) NULL,
	[FornitoreName] [varchar](100) NULL,
	[UnitaMisuraName] [varchar](100) NULL,
	[TipologiaName] [varchar](100) NULL,
	[Quantita] [varchar](100) NULL,
	[Giacenza] [varchar](100) NULL,
	[Temporaneo] [varchar](100) NULL,
	[TipoRicambio] [varchar](100) NULL,
	[NomeRicambio] [varchar](100) NULL,
	[CodiceFornitore] [varchar](100) NULL,
	[Serie] [varchar](100) NULL,
	[Marca] [varchar](100) NULL,
	[Colore] [varchar](100) NULL,
	[Matricola] [varchar](100) NULL,
	[Descrizione] [varchar](255) NULL,
	[LuogoTipo] [varchar](100) NULL,
	[LuogoId] [varchar](100) NULL,
	[LuogoNome] [varchar](100) NULL,
	[LuogoCodice] [varchar](100) NULL,
	[UltimoDownload] [smalldatetime] NULL,
	[UltimoUpload] [smalldatetime] NULL,
	[fkRicambio] [int] NULL,
	[Fonte] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRicambio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
