/****** Object:  Table [dbo].[lsrttb]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrttb](
	[lsrttb_key_id_ricev] [char](6) NOT NULL,
	[lsrttb_codice_totobit] [char](5) NULL,
	[lsrttb_data_attivazione] [char](8) NULL,
	[lsrttb_data_inserimento] [char](8) NOT NULL,
	[lsrttb_data_fine_validita] [char](8) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
