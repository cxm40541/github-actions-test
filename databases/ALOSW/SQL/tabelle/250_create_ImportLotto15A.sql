/****** Object:  Table [dbo].[ImportLotto15A]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ImportLotto15A](
	[IdImpLottoA] [int] IDENTITY(1,1) NOT NULL,
	[DataDa] [smalldatetime] NULL,
	[DataA] [smalldatetime] NULL,
	[Identificativo] [varchar](50) NULL,
	[Contratto] [varchar](50) NULL,
	[ParametriContr] [varchar](250) NULL,
	[CNTTOTIN] [float] NULL,
	[CNTTOTOT] [float] NULL,
	[UltimaLettura] [smalldatetime] NULL,
	[CNTTOTINOLD] [float] NULL,
	[CNTTOTOTOLD] [float] NULL,
	[LetturaPre] [smalldatetime] NULL,
	[ImponibilePreu] [float] NULL,
	[PREU] [float] NULL,
	[Canone] [float] NULL,
	[QuotaConc] [float] NULL,
	[QuotaGest] [float] NULL,
	[CanoneIntercon] [float] NULL,
	[FORFETTARIOPre] [float] NULL,
	[FORFETTARIOCorr] [float] NULL,
	[FORFETTARIOCum] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdImpLottoA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
