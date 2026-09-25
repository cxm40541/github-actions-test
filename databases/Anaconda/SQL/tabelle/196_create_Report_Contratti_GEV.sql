/****** Object:  Table [dbo].[Report_Contratti_GEV]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Report_Contratti_GEV](
	[RIC] [char](6) NOT NULL,
	[DENOMINAZIONE] [varchar](50) NULL,
	[INDIRIZZO] [char](60) NULL,
	[COMUNE] [char](50) NULL,
	[PROV] [char](2) NULL,
	[CAP] [char](5) NULL,
	[TELEFONO] [char](12) NULL,
	[M320] [char](2) NULL,
	[M350] [char](2) NULL,
	[M370] [char](2) NULL,
	[M380] [char](2) NULL,
	[BCR] [char](2) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
