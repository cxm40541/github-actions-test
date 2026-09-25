/****** Object:  Table [dbo].[CAMBIA_CHITA_Storico]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CAMBIA_CHITA_Storico](
	[Pk] [int] IDENTITY(1,1) NOT NULL,
	[Fk] [int] NULL,
	[sn] [varchar](80) NULL,
	[vendor] [varchar](80) NULL,
	[giorno] [smalldatetime] NULL,
	[firstupdate] [smalldatetime] NULL,
	[lastupdate] [smalldatetime] NULL,
	[sEntrate_Totali] [float] NULL,
	[sUscite_Totali] [float] NULL,
	[sFondo_Cassa] [float] NULL,
	[sBanconote_Entrate] [float] NULL,
	[sBanconote_Uscite] [float] NULL,
	[sBanconote_Refill] [float] NULL,
	[sBanconote_Svuot] [float] NULL,
	[sMonete_Entrate] [float] NULL,
	[sMonete_Uscite] [float] NULL,
	[sMonete_Refill] [float] NULL,
	[sMonete_Svuot] [float] NULL,
	[Entrate_Totali] [float] NULL,
	[Uscite_Totali] [float] NULL,
	[Fondo_Cassa] [float] NULL,
	[Banconote_Entrate] [float] NULL,
	[Banconote_Uscite] [float] NULL,
	[Banconote_Refill] [float] NULL,
	[Banconote_Svuot] [float] NULL,
	[Monete_Entrate] [float] NULL,
	[Monete_Uscite] [float] NULL,
	[Monete_Refill] [float] NULL,
	[Monete_Svuot] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
