/****** Object:  Table [dbo].[Servizi_LIS]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Servizi_LIS](
	[cod_Servizio] [char](2) NULL,
	[Descrizione] [char](40) NULL,
	[categoria] [char](2) NULL,
	[servizio] [char](2) NULL,
	[attivita] [char](2) NULL,
	[stato] [char](1) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
