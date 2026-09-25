/****** Object:  Table [dbo].[MovePlan]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MovePlan](
	[IdMovePlan] [int] IDENTITY(1,1) NOT NULL,
	[TipoOggetto] [int] NULL,
	[LuogoProv] [int] NULL,
	[TipoProv] [int] NULL,
	[LuogoDest] [int] NULL,
	[TipoDest] [int] NULL,
	[Data] [smalldatetime] NULL,
	[Status] [varchar](20) NULL,
	[IdMove] [int] NULL,
	[IdDDT] [int] NULL,
	[DataPlan] [smalldatetime] NULL,
	[Ord] [int] NULL,
	[IdTecnico] [int] NULL,
	[Note] [varchar](255) NULL,
	[CodiceOggetto] [int] NULL,
	[Contatore1] [float] NULL,
	[Contatore2] [float] NULL,
	[Contatore3] [float] NULL,
	[Contatore4] [float] NULL,
	[ParTipoDestScheda] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMovePlan] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
