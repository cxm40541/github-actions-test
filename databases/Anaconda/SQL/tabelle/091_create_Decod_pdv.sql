/****** Object:  Table [dbo].[Decod_pdv]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Decod_pdv](
	[TIPO] [char](3) NOT NULL,
	[PREFISSO_LTM] [char](3) NOT NULL,
	[PREFISSO_SGI] [char](3) NULL,
	[PREFISSO_TTB] [char](3) NULL,
	[DESCRIZIONE] [varchar](50) NULL,
	[SAP_GruppoConti_CLI] [char](4) NULL,
	[SAP_GruppoConti_FOR] [char](4) NULL,
	[SAP_ContoMastro_CLI] [char](6) NULL,
	[SAP_ContoMastro_FOR] [char](6) NULL,
	[SAP_Societa1] [char](3) NULL,
	[SAP_Societa2] [char](3) NULL,
	[SAP_Societa3] [char](3) NULL,
	[SAP_Societa4] [char](3) NULL,
	[SAP_Societa5] [char](3) NULL,
	[SAP_Societa6] [char](3) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
