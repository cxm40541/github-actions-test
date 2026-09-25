/****** Object:  Table [dbo].[report_tris]    Script Date: 11/17/2025 15:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[report_tris](
	[cod_lottomatica] [char](6) NULL,
	[cognome] [char](24) NULL,
	[nome] [char](20) NULL,
	[flag_contratto] [char](1) NULL,
	[flag_aps] [char](1) NULL,
	[flag_fid] [char](1) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
