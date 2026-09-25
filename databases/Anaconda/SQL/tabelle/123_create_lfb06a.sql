/****** Object:  Table [dbo].[lfb06a]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lfb06a](
	[lfb06a_key_id_ricev] [char](6) NOT NULL,
	[lfb06a_corner] [char](6) NOT NULL,
	[lfb06a_provider] [char](1) NULL,
	[lfb06a_concessione] [char](5) NULL,
	[lfb06a_flag_old_ricev] [char](1) NULL,
	[lfb06a_data_inizio_validita] [char](8) NOT NULL,
	[lfb06a_data_fine_validita] [char](8) NOT NULL,
 CONSTRAINT [PK_lfb06a] PRIMARY KEY CLUSTERED 
(
	[lfb06a_key_id_ricev] ASC,
	[lfb06a_data_inizio_validita] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
