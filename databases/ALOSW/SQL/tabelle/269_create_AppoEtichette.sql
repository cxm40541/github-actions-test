/****** Object:  Table [dbo].[AppoEtichette]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AppoEtichette](
	[MyId] [int] IDENTITY(1,1) NOT NULL,
	[DenGestore] [nvarchar](100) NULL,
	[CodGestore] [nvarchar](50) NULL,
	[CodeIdAWP] [nvarchar](50) NULL,
	[CodeIdAWPProv] [nvarchar](50) NULL,
	[ModelloAWP] [nvarchar](150) NULL,
	[SecondoStatoAWP] [nvarchar](150) NULL,
	[DenEsercizio] [nvarchar](250) NULL,
	[VeseEsercizio] [nvarchar](50) NULL,
	[TipoEsercizio] [nvarchar](150) NULL,
	[DataUltimaMov] [smalldatetime] NULL,
	[CodiceMobile] [nvarchar](50) NULL,
	[CodiceScheda] [nvarchar](50) NULL,
	[RDAMobile] [varchar](50) NULL,
	[ODAMobile] [varchar](50) NULL,
	[RDASCHEDA] [varchar](50) NULL,
	[ODASCHEDA] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
