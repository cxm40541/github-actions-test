/****** Object:  Table [dbo].[RefillHopper]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RefillHopper](
	[IdRefillHopper] [int] IDENTITY(1,1) NOT NULL,
	[IdHopper] [int] NULL,
	[Data] [smalldatetime] NULL,
	[RefillLocale] [float] NULL,
	[RefillSocieta] [float] NULL,
	[BollettaIncasso] [int] NULL,
	[IdApparecchio] [int] NULL,
	[TipoApparecchio] [int] NULL,
	[IdLocale] [int] NULL,
	[MonetaFill1] [int] NULL,
	[MonetaFill2] [int] NULL,
	[MonetaFill3] [int] NULL,
	[QTAFill1] [int] NULL,
	[QTAFill2] [int] NULL,
	[QTAFill3] [int] NULL,
	[Trasferito] [int] NULL,
	[Tipo] [varchar](10) NULL,
	[Contato] [bit] NULL,
	[Sezionale] [int] NULL,
	[Note] [varchar](255) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
