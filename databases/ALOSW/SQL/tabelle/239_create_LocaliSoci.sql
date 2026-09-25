/****** Object:  Table [dbo].[LocaliSoci]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LocaliSoci](
	[IdSocio] [int] IDENTITY(1,1) NOT NULL,
	[FkLocale] [int] NULL,
	[ModNome] [varchar](100) NULL,
	[ModCognome] [varchar](100) NULL,
	[ModPiva] [varchar](50) NULL,
	[ModCF] [varchar](50) NULL,
	[ModNazione] [varchar](100) NULL,
	[ModIndirizzo] [varchar](150) NULL,
	[ModCap] [varchar](10) NULL,
	[ModComune] [varchar](100) NULL,
	[ModProv] [varchar](10) NULL,
	[ModTel] [varchar](50) NULL,
	[ModFax] [varchar](50) NULL,
	[ModMail] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSocio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
