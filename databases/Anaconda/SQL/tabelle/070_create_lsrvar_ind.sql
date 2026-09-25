/****** Object:  Table [dbo].[lsrvar_ind]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrvar_ind](
	[lsrvar_ind_key_id_ricev] [char](6) NOT NULL,
	[lsrvar_ind_data] [char](8) NOT NULL,
	[lsrvar_ind_cod_serv] [char](2) NOT NULL,
	[lsrvar_ind_indirizzo] [char](40) NULL,
	[lsrvar_ind_cap] [char](5) NULL,
	[lsrvar_ind_comune] [char](24) NULL,
	[lsrvar_ind_provincia] [char](2) NULL,
	[lsrvar_ind_data_elab] [char](8) NULL,
 CONSTRAINT [PK_lsrvar_ind] PRIMARY KEY CLUSTERED 
(
	[lsrvar_ind_key_id_ricev] ASC,
	[lsrvar_ind_data] ASC,
	[lsrvar_ind_cod_serv] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
