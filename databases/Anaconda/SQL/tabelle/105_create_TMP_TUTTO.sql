/****** Object:  Table [dbo].[TMP_TUTTO]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TMP_TUTTO](
	[ID_NUM] [int] NOT NULL,
	[cez] [varchar](2) NOT NULL,
	[classe] [char](1) NOT NULL,
	[ricevitoria] [char](6) NOT NULL,
	[operatore] [varchar](3) NOT NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
