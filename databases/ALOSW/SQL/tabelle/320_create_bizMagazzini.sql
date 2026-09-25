/****** Object:  Table [dbo].[bizMagazzini]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bizMagazzini](
	[IdMagazzino] [int] IDENTITY(1,1) NOT NULL,
	[NomeMagazzino] [nvarchar](150) NULL,
	[Indirizzo] [nvarchar](255) NULL,
	[Cap] [nvarchar](6) NULL,
	[Comune] [nvarchar](50) NULL,
	[Provincia] [nvarchar](2) NULL,
	[Telefono] [nvarchar](30) NULL,
	[Via] [nvarchar](120) NULL,
	[Civico] [nvarchar](20) NULL,
	[ParToponimo] [int] NULL,
	[CodGestore] [char](20) NULL,
	[CodAAMS] [varchar](20) NULL,
	[CodPda1] [varchar](20) NULL,
	[CodPda2] [varchar](20) NULL,
	[CodPda3] [varchar](20) NULL,
	[CodPda4] [varchar](20) NULL,
	[PIVA] [varchar](20) NULL,
	[BizMacro] [int] NULL,
	[Codice] [nvarchar](10) NULL,
	[IdZona] [int] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
