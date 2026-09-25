/****** Object:  Table [dbo].[lsrdati_sens_storico]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrdati_sens_storico](
	[Cod_Lottom] [varchar](6) NOT NULL,
	[Data_Immissione] [datetime] NOT NULL,
	[EsitoContatto] [int] NOT NULL,
	[FlagCell] [int] NOT NULL,
	[FlagEmail] [int] NOT NULL,
 CONSTRAINT [PK_lsrdati_sens_storico_1] PRIMARY KEY CLUSTERED 
(
	[Cod_Lottom] ASC,
	[Data_Immissione] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
