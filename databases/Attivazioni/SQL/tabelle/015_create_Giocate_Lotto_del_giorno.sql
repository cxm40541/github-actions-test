/****** Object:  Table [dbo].[Giocate_Lotto_del_giorno]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Giocate_Lotto_del_giorno](
	[orario] [char](5) NULL,
	[run] [char](3) NULL,
	[num_giocate] [int] NULL,
	[imp_giocate] [decimal](15, 2) NULL,
	[num_giocate_medie] [int] NULL,
	[imp_giocate_medie] [decimal](15, 2) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
