/****** Object:  Table [dbo].[S2T_tipo_operazione]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[S2T_tipo_operazione](
	[tipo_operazione] [smallint] NOT NULL,
	[descrizione] [varchar](100) NULL,
	[note] [varchar](255) NULL,
 CONSTRAINT [PK_S2T_tipo_operazione] PRIMARY KEY CLUSTERED 
(
	[tipo_operazione] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
