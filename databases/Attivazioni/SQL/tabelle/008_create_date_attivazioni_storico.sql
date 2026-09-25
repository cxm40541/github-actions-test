/****** Object:  Table [dbo].[date_attivazioni_storico]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[date_attivazioni_storico](
	[ricevitoria] [char](6) NULL,
	[postazione] [char](1) NULL,
	[data_attivazione] [datetime] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
