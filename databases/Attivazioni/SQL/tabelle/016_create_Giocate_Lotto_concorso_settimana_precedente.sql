/****** Object:  Table [dbo].[Giocate_Lotto_concorso_settimana_precedente]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Giocate_Lotto_concorso_settimana_precedente](
	[orario] [char](5) NOT NULL,
	[run] [char](3) NOT NULL,
	[num_giocate_concorso_settimana_precedente] [int] NULL,
	[imp_giocate_concorso_settimana_precedente] [decimal](15, 2) NULL,
	[num_giocate_concorso_attuale] [int] NULL,
	[imp_giocate_concorso_attuale] [decimal](15, 2) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
