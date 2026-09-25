/****** Object:  Table [dbo].[bolo_2]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bolo_2](
	[ricev] [char](6) NOT NULL,
	[stipula] [char](8) NOT NULL,
	[cessazione] [char](8) NULL,
	[cognome] [varchar](25) NULL,
	[nome] [varchar](25) NULL,
 CONSTRAINT [PK_bolo2] PRIMARY KEY NONCLUSTERED 
(
	[ricev] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
