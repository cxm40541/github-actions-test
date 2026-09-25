/****** Object:  Table [dbo].[lsrfon_lis]    Script Date: 11/17/2025 15:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrfon_lis](
	[lsrfon_lis_key_tipo] [char](1) NOT NULL,
	[lsrfon_lis_key_fonte] [char](2) NOT NULL,
	[lsrfon_lis_descrizione] [char](50) NULL,
	[lsrfon_lis_descrizione_breve] [char](20) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
