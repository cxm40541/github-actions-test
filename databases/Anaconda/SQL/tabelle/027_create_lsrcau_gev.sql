/****** Object:  Table [dbo].[lsrcau_gev]    Script Date: 11/17/2025 15:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrcau_gev](
	[lsrcau_gev_key_tipo] [char](1) NOT NULL,
	[lsrcau_gev_key_id_causale] [varchar](2) NOT NULL,
	[lsrcau_gev_causale] [varchar](50) NULL,
	[lsrcau_gev_fonte] [varchar](50) NULL,
 CONSTRAINT [PK_lsrcau_gev] PRIMARY KEY CLUSTERED 
(
	[lsrcau_gev_key_tipo] ASC,
	[lsrcau_gev_key_id_causale] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
