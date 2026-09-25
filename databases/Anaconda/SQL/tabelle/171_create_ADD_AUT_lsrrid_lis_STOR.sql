/****** Object:  Table [dbo].[ADD_AUT_lsrrid_lis_STOR]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ADD_AUT_lsrrid_lis_STOR](
	[lsrrid_lis_key_id_ricev] [char](6) NOT NULL,
	[lsrrid_lis_key_data_ins] [char](8) NOT NULL,
	[lsrrid_lis_key_ora_ins] [char](8) NOT NULL,
	[lsrrid_lis_data_inizio_val] [char](8) NOT NULL,
	[lsrrid_lis_data_fine_val] [char](8) NOT NULL,
	[lsrrid_lis_abi] [char](5) NULL,
	[lsrrid_lis_cab] [char](5) NULL,
	[lsrrid_lis_conto] [char](15) NULL,
	[lsrrid_lis_cin] [char](1) NULL,
	[lsrrid_lis_tipo_servizio] [char](2) NOT NULL,
	[lsrrid_lis_data_elab] [char](8) NOT NULL,
	[lsrrid_lis_scarto] [char](1) NOT NULL,
 CONSTRAINT [PK_ADD_AUT_lsrrid_lis_STOR] PRIMARY KEY CLUSTERED 
(
	[lsrrid_lis_key_id_ricev] ASC,
	[lsrrid_lis_key_data_ins] ASC,
	[lsrrid_lis_key_ora_ins] ASC,
	[lsrrid_lis_tipo_servizio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
