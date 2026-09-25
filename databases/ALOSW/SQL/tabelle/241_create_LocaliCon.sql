/****** Object:  Table [dbo].[LocaliCon]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LocaliCon](
	[IdLocCon] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](50) NULL,
	[Indirizzo] [varchar](150) NULL,
	[NumCiv] [varchar](5) NULL,
	[Localita] [varchar](50) NULL,
	[Cap] [varchar](5) NULL,
	[Pr] [varchar](2) NULL,
	[Ripassare] [varchar](50) NULL,
	[UltimaVisita] [smalldatetime] NULL,
	[ScadenzaContratto] [smalldatetime] NULL,
	[InstallazioneMacchine] [smalldatetime] NULL,
	[IsEsclusiva] [bit] NULL,
	[IdNolConc] [int] NULL,
	[ANewSlot] [int] NULL,
	[AMeccanici] [int] NULL,
	[ADistribut] [int] NULL,
	[AC7A] [int] NULL,
	[AC7C] [int] NULL,
	[BNewSlot] [int] NULL,
	[BMeccanici] [int] NULL,
	[BDistribut] [int] NULL,
	[BC7A] [int] NULL,
	[BC7C] [int] NULL,
	[IdZona] [int] NULL,
	[IdAgente] [int] NULL,
	[IncassoSettimanale] [float] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
