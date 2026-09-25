/****** Object:  Table [dbo].[rfid]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rfid](
	[Modello] [nvarchar](255) NULL,
	[Matricola] [nvarchar](255) NULL,
	[identificativo] [nvarchar](255) NULL,
	[nullaosta] [nvarchar](255) NULL,
	[altrocodice] [nvarchar](255) NULL
) ON [DATA]
GO
