/****** Object:  Table [dbo].[lsrfir]    Script Date: 11/17/2025 15:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrfir](
	[lsrfir_key_user_id] [char](17) NOT NULL,
	[lsrfir_data_inizio_abil] [char](8) NULL,
	[lsrfir_data_fine_abil] [char](8) NULL,
	[lsrfir_cod_uff] [char](5) NOT NULL,
 CONSTRAINT [PK_lsrfir] PRIMARY KEY NONCLUSTERED 
(
	[lsrfir_key_user_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [INDEX]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
