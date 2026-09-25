/****** Object:  Table [dbo].[lfb08a]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lfb08a](
	[lfb08a_key_id_ricev] [char](6) NOT NULL,
	[lfb08a_key_cod_aams] [char](5) NOT NULL,
	[lfb08a_cod_amm] [char](6) NOT NULL,
	[lfb08a_provider] [char](1) NULL,
	[lfb08a_data_mod] [char](8) NOT NULL,
 CONSTRAINT [PK_lfb08a] PRIMARY KEY CLUSTERED 
(
	[lfb08a_key_id_ricev] ASC,
	[lfb08a_key_cod_aams] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
