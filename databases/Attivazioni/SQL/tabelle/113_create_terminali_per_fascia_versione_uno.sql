/****** Object:  Table [dbo].[terminali_per_fascia_versione_uno]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[terminali_per_fascia_versione_uno](
	[ricevitoria] [char](6) NOT NULL,
	[terminale] [char](1) NOT NULL,
	[fascia] [char](1) NOT NULL,
 CONSTRAINT [PK_terminali_per_fascia_versione_uno] PRIMARY KEY CLUSTERED 
(
	[ricevitoria] ASC,
	[terminale] ASC,
	[fascia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
