/****** Object:  Table [dbo].[software_old]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[software_old](
	[cod_lott] [char](6) NOT NULL,
	[postazione] [char](1) NOT NULL,
	[tipo_term] [char](10) NULL,
	[matricola] [char](11) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
