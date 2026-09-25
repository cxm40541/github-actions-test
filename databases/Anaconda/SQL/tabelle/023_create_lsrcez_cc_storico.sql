/****** Object:  Table [dbo].[lsrcez_cc_storico]    Script Date: 11/17/2025 15:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrcez_cc_storico](
	[lsrcez_cc_storico_data_ins] [char](8) NOT NULL,
	[lsrcez_cc_storico_prov] [char](2) NOT NULL,
	[lsrcez_cc_storico_classe] [char](1) NOT NULL,
	[lsrcez_cc_storico_N_locali] [int] NOT NULL,
	[lsrcez_cc_storico_N_extralocali] [int] NOT NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
