/****** Object:  Table [dbo].[VerificheConti]    Script Date: 11/17/2025 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VerificheConti](
	[IdVerificaConto] [int] IDENTITY(1,1) NOT NULL,
	[Data] [smalldatetime] NULL,
	[IdEsattore] [int] NULL,
	[TotalePrevisto] [float] NULL,
	[TotaleEffettivo] [float] NULL,
	[TotaleAtteso] [float] NULL,
	[Num500] [int] NULL,
	[Num200] [int] NULL,
	[Num100] [int] NULL,
	[Num50] [int] NULL,
	[Num20] [int] NULL,
	[Num10] [int] NULL,
	[Num5] [int] NULL,
	[Num2] [int] NULL,
	[Num1] [int] NULL,
	[Num050] [int] NULL,
	[Num020] [int] NULL,
	[Num010] [int] NULL,
	[Num005] [int] NULL,
	[Num002] [int] NULL,
	[Num001] [int] NULL,
	[NumAssegni] [int] NULL,
	[TotaleAssegni] [float] NULL,
	[NumeroBolletta] [int] NULL,
	[TipoConto] [int] NULL,
	[DataConto] [smalldatetime] NULL,
	[Note] [varchar](250) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
