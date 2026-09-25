/****** Object:  Table [dbo].[pass_bollo_2]    Script Date: 11/17/2025 15:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pass_bollo_2](
	[ricev] [char](6) NOT NULL,
	[stipula] [char](8) NULL,
	[cessazione] [char](8) NULL,
	[PROVV_CESSAZ] [char](1) NULL,
	[cognome] [char](24) NULL,
	[nome] [char](20) NULL,
	[cfisc] [char](16) NULL,
	[datatit] [char](8) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
