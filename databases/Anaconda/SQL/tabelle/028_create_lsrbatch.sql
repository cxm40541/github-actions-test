/****** Object:  Table [dbo].[lsrbatch]    Script Date: 11/17/2025 15:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrbatch](
	[lsrbatch_key_id_ricev] [char](6) NOT NULL,
	[lsrbatch_Ric] [char](1) NULL,
	[lsrbatch_Tit] [char](1) NULL,
	[lsrbatch_Lotto] [char](1) NULL,
	[lsrbatch_F101] [char](1) NULL,
	[lsrbatch_Rai] [char](1) NULL,
	[lsrbatch_Info] [char](1) NULL,
	[lsrbatch_Bollo] [char](1) NULL,
	[lsrbatch_Big] [char](1) NULL,
	[lsrbatch_Comune] [char](1) NULL,
	[lsrbatch_Tris] [char](1) NULL,
 CONSTRAINT [PK_lsrbatch] PRIMARY KEY NONCLUSTERED 
(
	[lsrbatch_key_id_ricev] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
