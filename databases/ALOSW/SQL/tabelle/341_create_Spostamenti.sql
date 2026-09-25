/****** Object:  Table [dbo].[Spostamenti]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Spostamenti](
	[IdSpostamento] [int] IDENTITY(1,1) NOT NULL,
	[IdDedicato] [int] NULL,
	[IdMobile] [int] NULL,
	[IdDistributore] [int] NULL,
	[IdDa] [int] NULL,
	[TipoDa] [smallint] NULL,
	[IdA] [int] NULL,
	[TipoA] [smallint] NULL,
	[Data] [smalldatetime] NULL,
	[IdSocieta] [int] NULL,
	[IsInviato] [bit] NULL,
	[IsRicevuto] [bit] NULL,
	[DataInvio] [smalldatetime] NULL,
	[DataAutorizzazione] [smalldatetime] NULL,
	[RifSpostamento] [varchar](30) NULL,
	[IdParSpostTipo] [int] NULL,
	[IdParRichiedente] [int] NULL,
	[LogUtenteId] [int] NULL,
	[LogUtenteNome] [varchar](100) NULL,
	[LogUtenteData] [smalldatetime] NULL,
	[IdAccessorio] [int] NULL,
	[DurataMinuti] [int] NULL,
	[IdOperatore] [int] NULL,
	[DataOraEffettiva] [varchar](50) NULL,
	[Note] [varchar](255) NULL,
	[HInizio] [int] NULL,
	[MInizio] [int] NULL,
	[HFine] [int] NULL,
	[MFine] [int] NULL,
	[CNTtotIN] [float] NULL,
	[CNTtotOUT] [float] NULL,
	[CNTtotMECIN] [float] NULL,
	[CNTtotMECOUT] [float] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
