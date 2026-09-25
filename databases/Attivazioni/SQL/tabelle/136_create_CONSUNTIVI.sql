/****** Object:  Table [dbo].[CONSUNTIVI]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CONSUNTIVI](
	[id_piano] [char](10) NOT NULL,
	[inizio] [datetime] NOT NULL,
	[fine] [datetime] NOT NULL,
	[pianificate] [int] NULL,
	[annullate] [int] NULL,
	[da_attivare] [int] NULL,
	[operative] [int] NULL,
	[op_in_commutata] [int] NULL,
	[non_operative] [int] NULL,
	[attesa_telecom] [int] NULL,
	[comp_lotto] [int] NULL,
	[prov_amm] [int] NULL,
	[temp_sospese] [int] NULL,
	[da_attivare2] [int] NULL,
	[totale] [int] NULL,
	[manc_stampante] [int] NULL,
	[da_visitare] [int] NULL,
	[errore] [int] NULL,
	[speciali] [int] NULL,
	[SenzaFlagPSort] [int] NULL,
 CONSTRAINT [PK_CONSUNTIVI] PRIMARY KEY CLUSTERED 
(
	[id_piano] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
