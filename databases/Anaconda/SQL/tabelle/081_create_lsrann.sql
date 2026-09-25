/****** Object:  Table [dbo].[lsrann]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrann](
	[lsrann_key_id_ricev] [char](6) NOT NULL,
	[lsrann_Pro] [char](1) NULL,
	[lsrann_Ric] [char](1) NULL,
	[lsrann_Tit] [char](1) NULL,
	[lsrann_Lotto] [char](1) NULL,
	[lsrann_F101] [char](1) NULL,
	[lsrann_Rai] [char](1) NULL,
	[lsrann_Info] [char](1) NULL,
	[lsrann_Bollo] [char](1) NULL,
	[lsrann_Big] [char](1) NULL,
	[lsrann_Comune] [char](1) NULL,
	[lsrann_Tris] [char](1) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
