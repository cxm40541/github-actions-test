/****** Object:  Table [dbo].[Move]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Move](
	[IdMove] [int] IDENTITY(1,1) NOT NULL,
	[Codice] [nvarchar](10) NULL,
	[DataCambio] [datetime] NULL,
	[DataFine] [nvarchar](10) NULL,
	[Locale] [int] NULL,
	[Mobile] [int] NULL,
	[Scheda] [int] NULL,
	[Dedicato] [int] NULL,
	[SIAE] [int] NULL,
	[MovimentoRif] [int] NULL,
	[contatore1] [float] NULL,
	[contatore2] [float] NULL,
	[contatore3] [float] NULL,
	[TipoIncasso] [int] NULL,
	[Prezzo1] [float] NULL,
	[Prezzo2] [float] NULL,
	[Prezzo3] [float] NULL,
	[Percentuale] [float] NULL,
	[Distributore] [int] NULL,
	[Merce] [nvarchar](10) NULL,
	[SerialeScheda] [int] NULL,
	[TipoAc] [int] NULL,
	[contatore4] [float] NULL,
	[Prezzo4] [float] NULL,
	[nData] [smalldatetime] NULL,
	[Accessorio] [int] NULL,
	[DataCambioOld] [nvarchar](10) NULL,
	[BMovePlan] [bit] NULL,
 CONSTRAINT [PK_Move] PRIMARY KEY CLUSTERED 
(
	[IdMove] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
