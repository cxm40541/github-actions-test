/****** Object:  Table [dbo].[fit]    Script Date: 11/17/2025 15:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[fit](
	[Ricevitoria] [char](6) NULL,
	[Data_Invio_Contr] [char](8) NULL,
	[Stato_Bollo] [char](1) NULL,
	[Data_Bollo] [char](8) NULL,
	[Stato_Lotto] [char](1) NULL,
	[Data_Lotto] [char](8) NULL,
	[Num_Contr_Ass_Att] [char](1) NULL,
	[Num_Contr_Ass_Prec] [char](1) NULL,
	[Num_Contr_Non_Ass] [char](1) NULL,
	[Causale_Dis] [char](150) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_fit] ON [dbo].[fit] 
(
	[Ricevitoria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
GO
