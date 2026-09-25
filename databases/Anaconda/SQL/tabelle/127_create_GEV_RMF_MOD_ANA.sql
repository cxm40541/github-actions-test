/****** Object:  Table [dbo].[GEV_RMF_MOD_ANA]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEV_RMF_MOD_ANA](
	[COD_LOTTO] [char](7) NULL,
	[DENOMINAZIONE] [nvarchar](50) NULL,
	[COMUNE] [nvarchar](40) NULL,
	[CAP] [char](5) NULL,
	[INDIRIZZO] [nvarchar](50) NULL,
	[PROV] [char](2) NULL,
	[TELEFONO] [nvarchar](12) NULL,
	[AZIONE] [char](1) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
