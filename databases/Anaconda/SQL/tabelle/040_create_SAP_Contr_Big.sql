/****** Object:  Table [dbo].[SAP_Contr_Big]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SAP_Contr_Big](
	[cliente] [char](10) NOT NULL,
	[tipo_contratto] [char](10) NULL,
	[stato] [char](11) NOT NULL,
	[descrizione] [char](50) NULL,
	[data_modifica] [char](8) NOT NULL,
	[flag_elab] [char](1) NOT NULL,
 CONSTRAINT [PK_SAP_Contr_Big] PRIMARY KEY CLUSTERED 
(
	[cliente] ASC,
	[stato] ASC,
	[data_modifica] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
