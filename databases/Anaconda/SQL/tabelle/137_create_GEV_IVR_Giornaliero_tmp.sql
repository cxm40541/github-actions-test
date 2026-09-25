/****** Object:  Table [dbo].[GEV_IVR_Giornaliero_tmp]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEV_IVR_Giornaliero_tmp](
	[Key_Desc] [varchar](10) NOT NULL,
	[Nome_File_RMF] [varchar](20) NULL,
	[ltm] [char](6) NOT NULL,
	[sgi] [char](7) NOT NULL,
	[ivr] [varchar](400) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
