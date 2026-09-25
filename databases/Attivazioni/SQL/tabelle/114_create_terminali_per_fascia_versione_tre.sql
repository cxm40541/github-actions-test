/****** Object:  Table [dbo].[terminali_per_fascia_versione_tre]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[terminali_per_fascia_versione_tre](
	[ricevitoria] [char](6) NOT NULL,
	[terminale] [char](1) NOT NULL,
	[fascia] [char](1) NOT NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
