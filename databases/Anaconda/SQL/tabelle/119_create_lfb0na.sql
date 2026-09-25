/****** Object:  Table [dbo].[lfb0na]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lfb0na](
	[lfb0na_key_id_ricev] [char](6) NOT NULL,
	[lfb0na_key_cod_aams] [char](5) NOT NULL,
	[lfb0na_provider] [char](1) NULL,
	[lfb0na_data_inizio_validita] [char](8) NOT NULL,
	[lfb0na_data_fine_validita] [char](8) NOT NULL,
 CONSTRAINT [PK_lfb0na] PRIMARY KEY CLUSTERED 
(
	[lfb0na_key_id_ricev] ASC,
	[lfb0na_key_cod_aams] ASC,
	[lfb0na_data_inizio_validita] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
