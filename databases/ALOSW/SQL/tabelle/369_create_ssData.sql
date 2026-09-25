/****** Object:  Table [dbo].[ssData]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ssData](
	[IdDato] [int] IDENTITY(1,1) NOT NULL,
	[Codice] [varchar](50) NULL,
	[Anno] [varchar](10) NULL,
	[Gruppo] [varchar](10) NULL,
	[Colonna] [varchar](10) NULL,
	[Key] [varchar](50) NULL,
	[Valore] [float] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
