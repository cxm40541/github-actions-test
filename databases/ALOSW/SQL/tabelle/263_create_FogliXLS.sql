/****** Object:  Table [dbo].[FogliXLS]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FogliXLS](
	[CodiceMobile] [nvarchar](255) NULL,
	[CodiceScheda] [nvarchar](255) NULL,
	[Identificativo] [nvarchar](255) NULL,
	[Gestore] [nvarchar](255) NULL,
	[AltroGestore] [nvarchar](255) NULL,
	[IdRicambioScheda] [int] NULL,
	[IdRicambioMobile] [int] NULL,
	[TipoGestore] [varchar](255) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
