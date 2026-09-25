/****** Object:  Table [dbo].[Imposte]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imposte](
	[IdImposta] [int] IDENTITY(1,1) NOT NULL,
	[Anno] [smallint] NULL,
	[IdMobile] [int] NULL,
	[IdDedicato] [int] NULL,
	[IdDistributore] [int] NULL,
	[ParTipologiaMonopoli] [int] NULL,
	[MesiCompetenza] [smallint] NULL,
	[Percentuale] [float] NULL,
	[Imponibile] [float] NULL,
	[Imposta] [float] NULL,
	[Prop] [int] NULL,
	[Associato] [int] NULL
) ON [DATA]
GO
