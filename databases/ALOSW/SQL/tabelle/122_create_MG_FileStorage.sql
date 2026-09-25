/****** Object:  Table [dbo].[MG_FileStorage]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MG_FileStorage](
	[IdFile] [int] IDENTITY(1,1) NOT NULL,
	[FileType] [int] NULL,
	[FileDate] [datetime] NULL,
	[FileSize] [int] NULL,
	[FileContent] [image] NULL,
 CONSTRAINT [PK_MG_FileStorage] PRIMARY KEY CLUSTERED 
(
	[IdFile] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA] TEXTIMAGE_ON [DATA]
GO
