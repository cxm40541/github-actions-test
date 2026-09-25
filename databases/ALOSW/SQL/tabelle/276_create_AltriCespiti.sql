/****** Object:  Table [dbo].[AltriCespiti]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AltriCespiti](
	[IdAltriCes] [int] IDENTITY(1,1) NOT NULL,
	[MatrAltriCes] [varchar](100) NULL,
	[DescAltriCes] [varchar](100) NULL,
	[CostoAltriCes] [float] NULL,
	[Fornitore] [varchar](100) NULL,
	[DataCreazione] [smalldatetime] NULL,
	[IdPropApp] [int] NULL,
	[CodCespite] [varchar](20) NULL,
	[DataFine] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAltriCes] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
