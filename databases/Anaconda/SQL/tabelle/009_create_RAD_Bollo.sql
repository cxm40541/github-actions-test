/****** Object:  Table [dbo].[RAD_Bollo]    Script Date: 11/17/2025 15:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RAD_Bollo](
	[cod_lott] [nvarchar](6) NULL,
	[tipo] [nvarchar](1) NULL,
	[data_rad] [nvarchar](8) NULL,
	[fonte] [nvarchar](1) NULL,
	[storico] [nvarchar](1) NULL,
	[provv_ass] [nvarchar](1) NULL,
	[provv_cod_ente] [nvarchar](2) NULL,
	[provv_prot] [nvarchar](20) NULL,
	[provv_data] [nvarchar](8) NULL,
	[id_provv] [int] NULL
) ON [DATA]
GO
