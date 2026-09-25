/****** Object:  Table [dbo].[lsrcez_cc]    Script Date: 11/17/2025 15:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrcez_cc](
	[lsrcez_cc_provincia] [char](2) NOT NULL,
	[lsrcez_cc_descrizione] [char](10) NOT NULL,
	[lsrcez_cc_n_addetti] [smallint] NOT NULL,
	[lsrcez_cc_peso] [float] NULL,
	[lsrcez_cc_cod_op] [char](2) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
