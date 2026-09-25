/****** Object:  Table [dbo].[RicambiGiacenza]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RicambiGiacenza](
	[IdGiacenza] [int] IDENTITY(1,1) NOT NULL,
	[fkRicambio] [int] NULL,
	[fkLuogo] [int] NULL,
	[TipoLuogo] [varchar](10) NULL,
	[Quantita] [int] NULL,
	[lastUpdate] [smalldatetime] NULL,
	[TipoGiacenza] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdGiacenza] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
