/****** Object:  Table [dbo].[TUTTO_LTM]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TUTTO_LTM](
	[RIC] [char](6) NOT NULL,
	[DENOMINAZIONE] [varchar](50) NULL,
	[TIPO_RICE] [char](1) NULL,
	[INDIRIZZO] [char](40) NULL,
	[COMUNE] [char](24) NULL,
	[PROV] [char](2) NULL,
	[CAP] [char](5) NULL,
	[TERM_INST] [char](8) NULL,
	[ABI_LTM] [char](5) NULL,
	[CAB_LTM] [char](5) NULL,
	[ABI_CONI] [char](5) NULL,
	[CAB_CONI] [char](5) NULL,
	[ABI_LIS] [char](5) NULL,
	[CAB_LIS] [char](5) NULL,
	[M320] [char](2) NULL,
	[M350] [char](2) NULL,
	[M370] [char](2) NULL,
	[M380] [char](2) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
