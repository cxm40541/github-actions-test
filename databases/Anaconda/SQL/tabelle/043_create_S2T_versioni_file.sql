/****** Object:  Table [dbo].[S2T_versioni_file]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[S2T_versioni_file](
	[data] [char](8) NOT NULL,
	[tipofile] [char](25) NOT NULL,
	[numerofile] [int] NOT NULL,
	[dataoramodifica] [datetime] NOT NULL,
 CONSTRAINT [PK_S2T_Versioni_File] PRIMARY KEY CLUSTERED 
(
	[data] ASC,
	[tipofile] ASC,
	[numerofile] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
