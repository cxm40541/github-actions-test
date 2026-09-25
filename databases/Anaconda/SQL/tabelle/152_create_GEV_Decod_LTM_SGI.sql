/****** Object:  Table [dbo].[GEV_Decod_LTM_SGI]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEV_Decod_LTM_SGI](
	[Key_Desc] [varchar](10) NOT NULL,
	[Rete_LTM] [char](2) NOT NULL,
	[Rete_SGI] [char](3) NOT NULL,
	[Rete_SGI_oversize] [char](3) NULL,
	[Rete_SGI_ext] [char](3) NULL,
	[Rete_SGI_oversize_ext] [char](3) NULL,
	[Descrizione] [varchar](50) NULL,
	[Ricerca_RID] [char](2) NULL,
	[Nome_File_RMF] [varchar](20) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
