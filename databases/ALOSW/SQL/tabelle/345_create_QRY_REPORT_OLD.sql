/****** Object:  Table [dbo].[QRY_REPORT_OLD]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QRY_REPORT_OLD](
	[IdReport] [int] IDENTITY(1,1) NOT NULL,
	[Titolo] [nvarchar](50) NULL,
	[Descrizione] [nvarchar](250) NULL,
	[sQuery] [nvarchar](4000) NULL,
	[Posizione] [int] NULL,
	[Metodologia] [varchar](4000) NULL,
	[UtentiAbilitati] [varchar](255) NULL,
 CONSTRAINT [PK_LOTTOMAGSTATS] PRIMARY KEY CLUSTERED 
(
	[IdReport] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
