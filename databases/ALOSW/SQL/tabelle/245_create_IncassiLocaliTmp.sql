/****** Object:  Table [dbo].[IncassiLocaliTmp]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncassiLocaliTmp](
	[IdIncassoLocTmp] [int] IDENTITY(1,1) NOT NULL,
	[Data] [smalldatetime] NULL,
	[IdLocale] [int] NULL,
	[IdEsattore] [int] NULL,
	[IdMobile_action] [int] NULL,
	[Acconto] [float] NULL,
	[Sospeso] [float] NULL,
	[Rientro] [float] NULL,
	[Sconto] [float] NULL,
	[Bonus] [float] NULL,
	[ImportoAssegni] [float] NULL,
	[AccontoUtilizzato] [float] NULL,
	[AccontoPrecedente] [float] NULL,
	[TotaleEsattore] [float] NULL,
	[TotParteSocieta] [float] NULL,
	[TotParteLocale] [float] NULL,
	[TotPreu] [float] NULL,
	[TotAAMS] [float] NULL,
	[TotRete] [float] NULL,
	[NumIncassati] [float] NULL,
	[NumApparecchi] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdIncassoLocTmp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
