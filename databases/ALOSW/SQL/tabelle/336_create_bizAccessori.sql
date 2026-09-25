/****** Object:  Table [dbo].[bizAccessori]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bizAccessori](
	[IdAccessorio] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NULL,
	[Tipologia] [int] NULL,
	[Matricola] [varchar](20) NULL,
	[Prop] [int] NULL,
	[IdMagazzino] [int] NULL,
	[Fornitore] [int] NULL,
	[Costruttore] [int] NULL,
	[DataCostruzione] [smalldatetime] NULL,
	[Cassa] [float] NULL,
	[Misure] [varchar](50) NULL,
	[AnnoCostruzione] [varchar](4) NULL,
	[Note] [varchar](255) NULL,
	[DataFine] [smalldatetime] NULL,
	[Attivo] [int] NULL,
	[NumDDTScarico] [char](30) NULL,
	[DestDDTScarico] [char](50) NULL,
	[NumDDT] [char](30) NULL,
	[NumFattura] [char](30) NULL,
	[TipoAcquisto] [int] NULL,
	[DataDDT] [smalldatetime] NULL,
	[DataFattura] [smalldatetime] NULL,
	[DataDDTScarico] [smalldatetime] NULL,
	[BizMacro] [int] NULL,
	[CodCespite] [varchar](20) NULL,
	[IdPropApp] [int] NULL,
	[bChiavi] [bit] NULL,
	[ParCausaleAttivo] [int] NULL,
	[CostoGestInst] [float] NULL,
	[CostoOpMag] [float] NULL,
	[PrezzoAcquisto] [float] NULL,
	[DataCreazione] [smalldatetime] NULL,
	[bAssicurazione] [bit] NULL,
	[NumCLeasing] [varchar](50) NULL,
	[Seriale] [varchar](50) NULL,
	[usr] [varchar](80) NULL,
	[sn] [varchar](80) NULL,
	[vendor] [varchar](80) NULL,
	[lastupdate] [smalldatetime] NULL,
	[totmonete] [float] NULL,
	[totbanconote] [float] NULL,
	[totale] [float] NULL,
	[IniTotMonete] [float] NULL,
	[IniTotBanconote] [float] NULL,
	[IniDataReset] [smalldatetime] NULL,
	[PropOld] [int] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
