/****** Object:  Table [dbo].[Hopper]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hopper](
	[IdHopper] [int] IDENTITY(1,1) NOT NULL,
	[IdDedicato] [int] NULL,
	[IdAccessorio] [int] NULL,
	[IdLocale] [int] NULL,
	[DataDa] [smalldatetime] NULL,
	[DataA] [smalldatetime] NULL,
	[NumHopper] [int] NULL,
	[ParModelloHopper] [int] NULL,
	[Moneta1] [float] NULL,
	[Moneta2] [float] NULL,
	[Moneta3] [float] NULL,
	[QTAInst1] [int] NULL,
	[QTAInst2] [int] NULL,
	[QTAInst3] [int] NULL,
	[QTAFine1] [int] NULL,
	[QTAFine2] [int] NULL,
	[QTAFine3] [int] NULL,
	[Totale] [float] NULL,
	[TotSocieta] [float] NULL,
	[TotLocale] [float] NULL,
	[NomeApparecchio] [varchar](50) NULL,
	[MonetaInst1] [float] NULL,
	[MonetaInst2] [float] NULL,
	[MonetaInst3] [float] NULL,
	[MonetaFine1] [float] NULL,
	[MonetaFine2] [float] NULL,
	[MonetaFine3] [float] NULL,
	[TotSocFin] [float] NULL,
	[TotLocFin] [float] NULL,
	[IdSocieta] [int] NULL,
	[Trasferito] [int] NULL,
	[WIS_NumImpClose] [int] NULL,
	[BollettaIncasso] [int] NULL,
	[Sezionale] [int] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
