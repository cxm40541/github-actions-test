/****** Object:  Table [dbo].[StabilitaDettaglioDovuto]    Script Date: 11/17/2025 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StabilitaDettaglioDovuto](
	[IdDettDovuto] [int] IDENTITY(1,1) NOT NULL,
	[FkStabilita] [int] NULL,
	[MacroConc] [varchar](50) NULL,
	[NumMacchine] [int] NULL,
	[ImportoDovuto] [float] NULL,
	[Percentuale] [float] NULL,
	[TipoCalcolo] [int] NULL,
	[ValoreCalcolo] [float] NULL,
	[BaseImponibile] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDettDovuto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
