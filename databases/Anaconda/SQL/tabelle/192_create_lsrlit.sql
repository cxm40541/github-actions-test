/****** Object:  Table [dbo].[lsrlit]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrlit](
	[lsrlit_key_id_ricev] [char](6) NOT NULL,
	[lsrlit_data_ins] [char](8) NOT NULL,
 CONSTRAINT [PK_lsrlit] PRIMARY KEY CLUSTERED 
(
	[lsrlit_key_id_ricev] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
