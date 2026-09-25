/****** Object:  Table [dbo].[bizSocieta]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bizSocieta](
	[IdSocieta] [int] IDENTITY(1,1) NOT NULL,
	[Codice] [nvarchar](10) NULL,
	[RagioneSociale] [nvarchar](80) NULL,
	[PIVA] [nvarchar](20) NULL,
	[CodiceSIAE] [nvarchar](10) NULL,
	[IndirizzoSO] [nvarchar](100) NULL,
	[CAPSO] [nvarchar](6) NULL,
	[LocalitaSO] [nvarchar](100) NULL,
	[ProvinciaSO] [nvarchar](5) NULL,
	[IndirizzoSL] [nvarchar](100) NULL,
	[CAPSL] [nvarchar](6) NULL,
	[ProvinciaSL] [nvarchar](5) NULL,
	[LocalitaSL] [nvarchar](100) NULL,
	[Sigla] [nvarchar](5) NULL,
	[CodiceFiscale] [nvarchar](20) NULL,
	[swIntFatDiversa] [bit] NULL,
	[IntFatRagSoc] [char](80) NULL,
	[IntFatPIVA] [char](20) NULL,
	[IntFatIndirizzo] [char](100) NULL,
	[IntFatCAP] [char](6) NULL,
	[IntFatLocalita] [char](100) NULL,
	[IntFatProvincia] [char](5) NULL,
	[BizMacro] [int] NULL,
	[LegaleRappresentante] [varchar](100) NULL,
	[swIntFatProvvigioni] [bit] NULL,
	[telefono] [varchar](100) NULL,
	[fax] [varchar](100) NULL,
	[CostoApparecchio] [float] NULL,
	[CostoVLT] [float] NULL,
 CONSTRAINT [PK_bizSocieta] PRIMARY KEY CLUSTERED 
(
	[IdSocieta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
