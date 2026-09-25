/****** Object:  Table [dbo].[adesioni_ricariche_lis]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[adesioni_ricariche_lis](
	[Cod_Lottomatica] [nvarchar](255) NULL,
	[Denominazione] [nvarchar](255) NULL,
	[tim] [smalldatetime] NULL,
	[omni] [smalldatetime] NULL
) ON [DATA]
GO
