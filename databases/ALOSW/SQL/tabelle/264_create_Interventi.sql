/****** Object:  Table [dbo].[Interventi]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Interventi](
	[IdIntervento] [int] IDENTITY(1,1) NOT NULL,
	[IdGuasto] [int] NULL,
	[CodiceGuasto] [int] NULL,
	[DataStartIntervento] [smalldatetime] NULL,
	[HStartIntervento] [int] NULL,
	[MStartIntervento] [int] NULL,
	[DataEndIntervento] [smalldatetime] NULL,
	[HEndIntervento] [int] NULL,
	[MEndIntervento] [int] NULL,
	[ParTipoIntervento] [int] NULL,
	[IdTecnico] [int] NULL,
	[IdRicambio] [int] NULL,
	[Qta] [int] NULL,
	[Descrizione] [char](255) NULL,
	[Stato] [char](20) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
