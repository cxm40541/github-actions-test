/****** Object:  Table [dbo].[BollettaTestata]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BollettaTestata](
	[IdBollettaT] [int] IDENTITY(1,1) NOT NULL,
	[NumeroBolletta] [int] NULL,
	[Sezionale] [int] NULL,
	[Descrizione] [varchar](250) NULL,
	[Data] [smalldatetime] NULL,
	[DataRegistrazione] [smalldatetime] NULL,
	[Stampata] [bit] NULL,
	[Contata] [bit] NULL,
	[IdEsattore] [int] NULL,
	[Modo] [varchar](10) NULL,
	[IdSocieta] [int] NULL,
	[ParteSocieta] [float] NULL,
	[ParteLocale] [float] NULL,
	[PartePreu] [float] NULL,
	[ParteRete] [float] NULL,
	[ParteAAMS] [float] NULL,
	[Incassi] [float] NULL,
	[Acconti] [float] NULL,
	[Refill] [float] NULL,
	[Versamenti] [float] NULL,
	[Spese] [float] NULL,
	[FondoCassa] [float] NULL,
	[Bonifico] [float] NULL,
	[Assegni] [float] NULL,
	[Esattore] [float] NULL,
	[IdUser] [int] NULL,
	[IdAzione] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdBollettaT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
