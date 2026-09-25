/****** Object:  Table [dbo].[lsrdec]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrdec](
	[lsrdec_nome_prov] [char](2) NOT NULL,
	[lsrdec_descriz_prov] [char](20) NOT NULL,
	[lsrdec_sigla_ruota] [char](2) NOT NULL,
	[lsrdec_posiz_ruota] [char](2) NOT NULL,
	[lsrdec_isp_comp] [char](3) NOT NULL,
	[lsrdec_capoluogo] [char](2) NOT NULL,
	[lsrdec_magazzino_fit] [char](5) NOT NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
