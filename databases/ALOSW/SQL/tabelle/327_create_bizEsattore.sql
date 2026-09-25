/****** Object:  Table [dbo].[bizEsattore]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bizEsattore](
	[IdEsattore] [int] IDENTITY(1,1) NOT NULL,
	[NomeEsattore] [nvarchar](80) NULL,
	[Modello] [nvarchar](50) NULL,
	[Targa] [nvarchar](15) NULL,
	[DataCons] [smalldatetime] NULL,
	[Zona] [nvarchar](50) NULL,
	[CellKey] [varchar](20) NULL,
	[Sospeso] [float] NULL,
	[IdZona] [int] NULL,
	[ParZone] [int] NULL,
	[Note] [varchar](250) NULL,
	[BizMacro] [int] NULL,
	[Cellulare] [nvarchar](50) NULL,
	[Datafine] [smalldatetime] NULL,
	[Email] [varchar](250) NULL,
	[CodiceEsattore] [varchar](50) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
