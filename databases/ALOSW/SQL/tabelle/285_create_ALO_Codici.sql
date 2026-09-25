/****** Object:  Table [dbo].[ALO_Codici]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALO_Codici](
	[Pk] [int] IDENTITY(1,1) NOT NULL,
	[Codice] [int] NULL,
	[Descrizione] [nvarchar](250) NULL
) ON [DATA]
GO
