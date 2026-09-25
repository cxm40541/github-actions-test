/****** Object:  Table [dbo].[Mobile_Users_Tree]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mobile_Users_Tree](
	[IdTree] [int] IDENTITY(1,1) NOT NULL,
	[FkPadre] [int] NULL,
	[FkFiglio] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTree] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
