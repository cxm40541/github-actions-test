/****** Object:  Table [dbo].[dbconi_nulla_osta_aams]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dbconi_nulla_osta_aams](
	[ID_CONI] [nvarchar](6) NULL,
	[ID_LOTTO] [nvarchar](6) NULL,
	[Cognome] [nvarchar](100) NULL,
	[Nome] [nvarchar](100) NULL,
	[PROV] [nvarchar](2) NULL,
	[DATA_INI_VAL] [nvarchar](8) NULL,
	[DATA_FINE_VAL] [nvarchar](8) NULL
) ON [DATA]
GO
