/****** Object:  Table [dbo].[lsr02a_appo]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsr02a_appo](
	[COD_LTM] [char](6) NOT NULL,
	[COD_AMM] [char](6) NULL,
	[DATA_DECOR] [char](8) NULL,
	[DATA_DECOR_AL] [char](8) NULL,
	[COGNOME] [char](24) NULL,
	[NOME] [char](20) NULL,
	[TIPO_PROVV] [char](1) NULL,
	[DATA_PROVV] [char](8) NULL,
	[DATA_NASCITA] [char](8) NULL,
	[COMUNE_NASCITA] [char](30) NULL,
	[PROVINCIA_NASCITA] [char](2) NULL,
	[CODICE_FISCALE] [char](17) NULL,
	[DECOD] [varchar](50) NULL,
	[INDIRIZZO] [char](40) NULL,
	[COMUNE] [char](24) NULL,
	[CAP] [char](5) NULL,
	[PROV] [char](2) NULL,
	[ISPETT] [char](2) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
