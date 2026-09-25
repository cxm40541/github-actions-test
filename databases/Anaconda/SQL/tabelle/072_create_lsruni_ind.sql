/****** Object:  Table [dbo].[lsruni_ind]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsruni_ind](
	[lsruni_ind_id_ricev] [char](6) NOT NULL,
	[lsruni_ind_comune] [char](24) NOT NULL,
	[lsruni_ind_prov] [char](2) NOT NULL,
	[lsruni_ind_cap] [char](5) NOT NULL,
	[lsruni_ind_indirizzo] [char](43) NULL,
	[lsruni_ind_telefono] [char](12) NULL,
	[lsruni_ind_cod_amm] [char](6) NOT NULL,
	[lsruni_ind_data] [char](8) NOT NULL,
	[lsruni_ind_flag_elab] [char](1) NOT NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
