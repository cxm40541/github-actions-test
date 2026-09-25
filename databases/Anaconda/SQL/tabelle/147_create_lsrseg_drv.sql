/****** Object:  Table [dbo].[lsrseg_drv]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrseg_drv](
	[lsrseg_drv_id] [int] IDENTITY(1,1) NOT NULL,
	[lsrseg_drv_descr] [varchar](50) NULL,
	[lsrseg_drv_peso] [decimal](18, 2) NULL,
	[lsrseg_drv_fk_cri] [int] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
