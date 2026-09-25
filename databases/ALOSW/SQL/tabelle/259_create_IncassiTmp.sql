/****** Object:  Table [dbo].[IncassiTmp]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncassiTmp](
	[IdIncassoTmp] [int] IDENTITY(1,1) NOT NULL,
	[Data] [smalldatetime] NULL,
	[IdLocale] [int] NULL,
	[IdOggetto] [int] NULL,
	[TipoOggetto] [int] NULL,
	[IdEsattore] [int] NULL,
	[IdMobile_action] [int] NULL,
	[Progressivo] [int] NULL,
	[cnIn] [float] NULL,
	[cnOut] [float] NULL,
	[ParteLocale] [float] NULL,
	[ParteSocieta] [float] NULL,
	[Preu] [float] NULL,
	[Rete] [float] NULL,
	[AAMS] [float] NULL,
	[Acconto] [float] NULL,
	[Refill] [float] NULL,
	[Scarto] [float] NULL,
	[Bonus] [float] NULL,
	[AccontoUtilizzato] [float] NULL,
	[AccontoPrecedente] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdIncassoTmp] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
