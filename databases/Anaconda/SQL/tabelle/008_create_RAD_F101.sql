/****** Object:  Table [dbo].[RAD_F101]    Script Date: 11/17/2025 15:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RAD_F101](
	[ID_provv] [int] NULL,
	[cod_lott] [nvarchar](6) NULL,
	[tipo] [nvarchar](1) NULL,
	[data_rad] [nvarchar](8) NULL,
	[fonte] [nvarchar](2) NULL,
	[storico] [nvarchar](1) NULL,
	[cognome] [nvarchar](25) NULL,
	[nome] [nvarchar](20) NULL,
	[note] [nvarchar](250) NULL
) ON [DATA]
GO
