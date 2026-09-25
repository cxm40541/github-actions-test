/****** Object:  Table [dbo].[Scadenze]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Scadenze](
	[IdScadenza] [int] IDENTITY(1,1) NOT NULL,
	[DataScadenza] [smalldatetime] NULL,
	[DataReminder] [smalldatetime] NULL,
	[ParTipoScadenza] [int] NULL,
	[IdLocale] [int] NULL,
	[NoteScadenza] [varchar](255) NULL,
	[IdUser] [int] NULL,
	[IsEffettuata] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdScadenza] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
