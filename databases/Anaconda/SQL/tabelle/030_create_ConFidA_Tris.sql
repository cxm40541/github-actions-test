/****** Object:  Table [dbo].[ConFidA_Tris]    Script Date: 11/17/2025 15:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConFidA_Tris](
	[ricev] [char](6) NOT NULL,
	[cognome] [char](25) NOT NULL,
	[nome] [char](25) NOT NULL,
	[telefono] [char](12) NULL,
	[data_tit] [char](8) NULL,
	[data_contratto] [char](8) NULL,
	[data_servizio] [char](8) NULL,
	[fidej_now] [char](4) NULL,
	[Aps] [char](1) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_ConFidA_Tris] ON [dbo].[ConFidA_Tris] 
(
	[ricev] ASC,
	[data_tit] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
GO
