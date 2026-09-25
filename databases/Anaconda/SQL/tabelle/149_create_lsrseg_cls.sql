/****** Object:  Table [dbo].[lsrseg_cls]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrseg_cls](
	[lsrseg_cls_id] [int] IDENTITY(1,1) NOT NULL,
	[lsrseg_cls_tipo] [char](1) NULL,
	[lsrseg_cls_fattore] [int] NULL,
	[lsrseg_cls_range_inizio] [char](10) NULL,
	[lsrseg_cls_range_fine] [char](10) NULL,
	[lsrseg_cls_valore] [varchar](50) NULL,
	[lsrseg_cls_fk_drv] [int] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
