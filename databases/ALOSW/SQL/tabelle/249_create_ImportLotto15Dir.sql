/****** Object:  Table [dbo].[ImportLotto15Dir]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ImportLotto15Dir](
	[IdImpLottoDir] [int] IDENTITY(1,1) NOT NULL,
	[DataDa] [smalldatetime] NULL,
	[DataA] [smalldatetime] NULL,
	[Identificativo] [varchar](50) NULL,
	[ESERCENTE] [varchar](50) NULL,
	[CONTRATTO] [varchar](50) NULL,
	[ParametriContr] [varchar](250) NULL,
	[UltimaLettura] [smalldatetime] NULL,
	[CNTTOTIN] [float] NULL,
	[CNTTOTOT] [float] NULL,
	[CNTTOTINOLD] [float] NULL,
	[CNTTOTOTOLD] [float] NULL,
	[RACCOLTA] [float] NULL,
	[PREMI] [float] NULL,
	[RACCOLTANetta] [float] NULL,
	[QUOTAGESTORE] [float] NULL,
	[QUOTAESERCENTE] [float] NULL,
	[IMPORTO] [float] NULL,
	[PREU] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdImpLottoDir] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
