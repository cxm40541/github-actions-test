/****** Object:  Table [dbo].[VociDDT]    Script Date: 11/17/2025 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VociDDT](
	[IdVoceDDT] [int] IDENTITY(1,1) NOT NULL,
	[IdDDT] [int] NULL,
	[Testo] [nvarchar](150) NULL,
	[Qta] [int] NULL,
	[Codice] [nvarchar](20) NULL,
	[Identificativo] [varchar](20) NULL,
	[Societa] [char](50) NULL,
	[FkArticolo] [int] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
