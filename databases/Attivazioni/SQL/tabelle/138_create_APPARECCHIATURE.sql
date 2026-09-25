/****** Object:  Table [dbo].[APPARECCHIATURE]    Script Date: 11/17/2025 15:21:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[APPARECCHIATURE](
	[cod_appar] [char](10) NOT NULL,
	[id_piano] [char](10) NOT NULL,
	[cod_tipo_appar] [char](2) NOT NULL,
	[data_valid] [datetime] NULL,
	[matricola] [char](11) NULL,
	[note] [char](50) NULL,
	[tecnici] [char](50) NULL,
 CONSTRAINT [PK_APPARECCHIATURE] PRIMARY KEY CLUSTERED 
(
	[cod_appar] ASC,
	[id_piano] ASC,
	[cod_tipo_appar] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
