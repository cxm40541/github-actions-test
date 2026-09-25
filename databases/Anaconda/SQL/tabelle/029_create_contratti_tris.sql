/****** Object:  Table [dbo].[contratti_tris]    Script Date: 11/17/2025 15:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contratti_tris](
	[cod_Lott] [char](6) NULL,
	[cognome] [char](24) NULL,
	[nome] [char](20) NULL,
	[DATA_acq_contr] [char](8) NULL,
	[DATA_contr] [char](8) NULL,
	[DATA_acq_fid_anno_prec] [char](8) NULL,
	[DATA_acq_fid_anno_corr] [char](8) NULL,
	[DATA_acq_aps] [char](8) NULL,
	[aps] [char](1) NULL,
	[DATA_acq_rin] [char](8) NULL,
	[DATA_rin] [char](8) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
