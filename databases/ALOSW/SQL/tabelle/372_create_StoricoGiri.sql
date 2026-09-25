/****** Object:  Table [dbo].[StoricoGiri]    Script Date: 11/17/2025 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StoricoGiri](
	[IdStorico] [int] IDENTITY(1,1) NOT NULL,
	[DataCreazione] [smalldatetime] NULL,
	[Cellulare] [varchar](20) NULL,
	[Note] [varchar](255) NULL,
	[bEvasa] [bit] NULL,
	[Locali] [int] NULL,
	[Apparecchi] [int] NULL,
	[GiroTXT] [varchar](8000) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
