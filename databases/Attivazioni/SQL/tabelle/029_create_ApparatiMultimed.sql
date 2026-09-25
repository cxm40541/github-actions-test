/****** Object:  Table [dbo].[ApparatiMultimed]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ApparatiMultimed](
	[Matricola] [nvarchar](20) NOT NULL,
	[Oggetto] [char](2) NOT NULL,
	[Postazione] [char](7) NOT NULL,
	[Piano] [nvarchar](10) NOT NULL,
	[Note] [nvarchar](50) NULL,
	[DataIns] [char](8) NOT NULL,
	[FlgValidita] [char](1) NOT NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
