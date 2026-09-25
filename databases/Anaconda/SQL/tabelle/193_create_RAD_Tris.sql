/****** Object:  Table [dbo].[RAD_Tris]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RAD_Tris](
	[ID_provv] [int] NULL,
	[cod_lott] [nvarchar](6) NULL,
	[tipo] [nvarchar](1) NULL,
	[data_rad] [nvarchar](8) NULL,
	[fonte] [nvarchar](1) NULL,
	[storico] [nvarchar](1) NULL,
	[cognome] [nvarchar](24) NULL,
	[nome] [nvarchar](20) NULL
) ON [DATA]
GO
