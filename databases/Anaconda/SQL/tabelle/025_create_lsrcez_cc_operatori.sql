/****** Object:  Table [dbo].[lsrcez_cc_operatori]    Script Date: 11/17/2025 15:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrcez_cc_operatori](
	[lsrcez_cc_operatori_cez] [char](2) NOT NULL,
	[lsrcez_cc_operatori_classe] [char](1) NULL,
	[lsrcez_cc_operatori_codice] [char](3) NOT NULL,
	[lsrcez_cc_operatori_peso] [float] NOT NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
