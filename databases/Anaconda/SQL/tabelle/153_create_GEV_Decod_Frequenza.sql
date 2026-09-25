/****** Object:  Table [dbo].[GEV_Decod_Frequenza]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GEV_Decod_Frequenza](
	[Catena] [char](1) NOT NULL,
	[Classe] [varchar](1) NOT NULL,
	[Operatore] [varchar](3) NOT NULL,
	[Frequenza] [char](2) NULL,
 CONSTRAINT [PK_GEV_Decod_Frequenza] PRIMARY KEY CLUSTERED 
(
	[Catena] ASC,
	[Classe] ASC,
	[Operatore] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
