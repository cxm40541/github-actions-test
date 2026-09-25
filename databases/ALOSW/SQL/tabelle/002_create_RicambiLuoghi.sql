/****** Object:  Table [dbo].[RicambiLuoghi]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RicambiLuoghi](
	[IdLuogo] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
	[Descrizione] [varchar](150) NULL,
	[Indirizzo] [varchar](150) NULL,
	[Note] [varchar](250) NULL,
	[bTempNonDisp] [bit] NULL,
	[bDefNonDisp] [bit] NULL,
	[bLCaricoIni] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLuogo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
