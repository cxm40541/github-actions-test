/****** Object:  Table [dbo].[lsrqst_Gev_ese]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrqst_Gev_ese](
	[lsrqst_Gev_ese_id] [char](2) NOT NULL,
	[lsrqst_Gev_ese_value] [varchar](50) NULL,
 CONSTRAINT [PK_lsrqst_Gev_ese] PRIMARY KEY CLUSTERED 
(
	[lsrqst_Gev_ese_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
