/****** Object:  Table [dbo].[ParToponimi]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParToponimi](
	[IdToponimo] [int] IDENTITY(1,1) NOT NULL,
	[CodiceToponimo] [nvarchar](255) NULL,
	[Toponimo] [nvarchar](255) NULL,
	[Attivo] [bit] NOT NULL
) ON [DATA]
GO
