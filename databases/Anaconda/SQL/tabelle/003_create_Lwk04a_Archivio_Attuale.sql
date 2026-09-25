/****** Object:  Table [dbo].[Lwk04a_Archivio_Attuale]    Script Date: 11/17/2025 15:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lwk04a_Archivio_Attuale](
	[Cod_Lottomatica] [varchar](6) NOT NULL,
	[Denominazione] [varchar](50) NOT NULL,
	[ABI] [varchar](5) NULL,
	[CAB] [varchar](5) NULL,
 CONSTRAINT [PK_Lwk04a_Archivio_Attuale] PRIMARY KEY CLUSTERED 
(
	[Cod_Lottomatica] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
