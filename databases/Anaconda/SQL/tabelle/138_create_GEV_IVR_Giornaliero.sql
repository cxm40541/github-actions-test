/****** Object:  Table [dbo].[GEV_IVR_Giornaliero]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEV_IVR_Giornaliero](
	[Key_Desc] [varchar](10) NOT NULL,
	[Nome_File_RMF] [varchar](20) NULL,
	[ltm] [char](6) NOT NULL,
	[sgi] [char](7) NOT NULL,
	[ivr] [varchar](400) NULL,
 CONSTRAINT [PK_GEV_IVR_Giornaliero] PRIMARY KEY CLUSTERED 
(
	[Key_Desc] ASC,
	[ltm] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
