/****** Object:  Table [dbo].[RicambiGruppo]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RicambiGruppo](
	[IdGruppo] [int] IDENTITY(1,1) NOT NULL,
	[Etichetta] [varchar](100) NULL,
	[Codice] [varchar](200) NULL,
	[FkLuogo] [int] NULL,
	[DateCreated] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdGruppo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
