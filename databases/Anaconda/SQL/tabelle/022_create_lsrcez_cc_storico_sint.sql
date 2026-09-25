/****** Object:  Table [dbo].[lsrcez_cc_storico_sint]    Script Date: 11/17/2025 15:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrcez_cc_storico_sint](
	[lsrcez_cc_storico_sint_data_ins] [char](8) NOT NULL,
	[lsrcez_cc_storico_sint_prov] [char](2) NOT NULL,
	[lsrcez_cc_storico_N_teoriche] [int] NOT NULL,
	[lsrcez_cc_storico_N_extra_carico] [int] NOT NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
