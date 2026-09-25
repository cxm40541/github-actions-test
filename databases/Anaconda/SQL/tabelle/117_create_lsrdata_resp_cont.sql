/****** Object:  Table [dbo].[lsrdata_resp_cont]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrdata_resp_cont](
	[lsrdata_resp_cont_ricev] [char](6) NOT NULL,
	[lsrdata_resp_cont_data_ins] [char](8) NOT NULL,
	[lsrdata_resp_cont_ora_ins] [char](8) NOT NULL,
	[lsrdata_resp_cont_inizio_validita] [char](8) NOT NULL,
	[lsrdata_resp_cont_fine_validita] [char](8) NOT NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
