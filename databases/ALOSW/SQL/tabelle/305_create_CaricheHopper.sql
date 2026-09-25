/****** Object:  Table [dbo].[CaricheHopper]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CaricheHopper](
	[IdCarica] [int] IDENTITY(1,1) NOT NULL,
	[IdHopper] [int] NULL,
	[OldLocale] [float] NULL,
	[OldSocieta] [float] NULL,
	[DataCambio] [smalldatetime] NULL,
	[NoteCarica] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCarica] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
