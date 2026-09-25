/****** Object:  Table [dbo].[lsrmat_GeV]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrmat_GeV](
	[lsrmat_GeV_key_id_causale] [int] NOT NULL,
	[lsrmat_GeV_descrizione] [varchar](100) NULL,
	[lsrmat_GeV_num_term] [char](1) NULL,
	[lsrmat_GeV_ret_status] [char](1) NULL,
	[lsrmat_GeV_ret_action] [char](1) NULL,
	[lsrmat_GeV_term_status] [char](1) NULL,
	[lsrmat_GeV_term_action] [char](1) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
