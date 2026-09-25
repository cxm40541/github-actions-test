/****** Object:  Table [dbo].[lsrdati_sens]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrdati_sens](
	[Cod_Lottom] [varchar](6) NOT NULL,
	[Data_Immissione] [datetime] NULL,
	[EsitoContatto] [int] NOT NULL,
	[FlagCell] [int] NOT NULL,
	[Cellulare] [varchar](15) NULL,
	[FlagEmail] [int] NOT NULL,
	[Email] [varchar](50) NULL,
	[DataMod] [datetime] NOT NULL,
 CONSTRAINT [PK_lsrdati_sens] PRIMARY KEY CLUSTERED 
(
	[Cod_Lottom] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
