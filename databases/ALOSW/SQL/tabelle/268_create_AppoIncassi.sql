/****** Object:  Table [dbo].[AppoIncassi]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AppoIncassi](
	[IdIncasso] [int] NULL,
	[IdConcessionario] [int] NULL,
	[IdConcSconto] [int] NULL,
	[Bonus] [float] NULL,
	[ScartoEsattore] [float] NULL,
	[VLTJackpotAccumulo] [float] NULL,
	[VLTJackpotPagato] [float] NULL,
	[VLTNumTicket] [float] NULL,
	[VLTJackpotPerc] [float] NULL,
	[VLTRealPreu] [float] NULL,
	[VLTRealAAMS] [float] NULL,
	[VLTRealConcessionario] [float] NULL,
	[VLTRealNetWin] [float] NULL,
	[VLTRealEsercente] [float] NULL,
	[VLTRealTicketNonRiscossi] [float] NULL,
	[VLTRealCassa] [float] NULL,
	[SaldoHopper] [float] NULL,
	[CassettoReale] [float] NULL,
	[RientroHopper] [float] NULL,
	[SaldoHopperManuale] [float] NULL,
	[RefillPagati] [float] NULL,
	[Sezionale] [int] NULL,
	[TipoRete] [int] NULL,
	[ValoreRete] [float] NULL,
	[ReteCalcolata] [bit] NULL,
	[NomeConcessionario] [varchar](100) NULL,
	[PercAAMS] [float] NULL,
	[PercPREU] [float] NULL,
	[FkBonusProfile] [int] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
