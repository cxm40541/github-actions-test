/****** Object:  Table [dbo].[lsrpvo_bkp_new]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrpvo_bkp_new](
	[lsrpvo_key_id_ricev] [char](6) NOT NULL,
	[lsrpvo_data_inizio] [char](8) NULL,
	[lsrpvo_classe] [char](1) NOT NULL,
	[lsrpvo_operatore] [char](3) NULL,
	[lsrpvo_gg_contatto] [char](1) NULL,
	[lsrpvo_bcr] [char](2) NULL,
	[lsrpvo_data_invio_SGI] [char](8) NULL,
	[lsrpvo_data_inst_bcr] [char](8) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
