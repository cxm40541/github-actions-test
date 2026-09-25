/****** Object:  Table [dbo].[Assegnazioni]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Assegnazioni](
	[IdAssegnazione] [int] IDENTITY(1,1) NOT NULL,
	[DataUscita] [smalldatetime] NULL,
	[KmUscita] [varchar](50) NULL,
	[NoteUscita] [varchar](255) NULL,
	[DataRientro] [smalldatetime] NULL,
	[KmRientro] [varchar](50) NULL,
	[NoteRientro] [varchar](255) NULL,
	[IdAssegnatario] [varchar](10) NULL,
	[IdAutomezzo] [int] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
