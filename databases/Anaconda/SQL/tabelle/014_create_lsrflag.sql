/****** Object:  Table [dbo].[lsrflag]    Script Date: 11/17/2025 15:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrflag](
	[lsrflag_key_id_ricev] [char](6) NOT NULL,
	[lsrflag_Ric] [char](1) NULL,
	[lsrflag_Tit] [char](1) NULL,
	[lsrflag_Lotto] [char](1) NULL,
	[lsrflag_F101] [char](1) NULL,
	[lsrflag_Rai] [char](1) NULL,
	[lsrflag_Info] [char](1) NULL,
	[lsrflag_Bollo] [char](1) NULL,
	[lsrflag_Big] [char](1) NULL,
	[lsrflag_Comune] [char](1) NULL,
	[lsrflag_Tris] [char](1) NULL,
	[lsrflag_GeV] [char](1) NULL,
	[lsrflag_Coni] [char](1) NULL,
	[lsrflag_ST] [char](1) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
