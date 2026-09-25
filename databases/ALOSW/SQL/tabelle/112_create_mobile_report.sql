/****** Object:  Table [dbo].[mobile_report]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[mobile_report](
	[IdReport] [int] IDENTITY(1,1) NOT NULL,
	[Titolo] [varchar](100) NULL,
	[Abstract] [varchar](255) NULL,
	[Foto] [varchar](100) NULL,
	[Channel] [varchar](100) NULL,
	[Contenuto] [varchar](255) NULL,
	[ObjDll] [varchar](255) NULL,
	[Tipo] [varchar](50) NULL,
	[bAttivo] [bit] NULL,
	[Code] [varchar](50) NULL,
	[Devices] [varchar](50) NULL,
	[CodeId] [int] NULL,
	[bPublic] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdReport] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
