/****** Object:  Table [dbo].[LogIncassiMobile]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LogIncassiMobile](
	[IdLogIncassoMobile] [int] IDENTITY(1,1) NOT NULL,
	[MobileSerial] [varchar](100) NULL,
	[MobileId] [int] NULL,
	[IdIncasso] [int] NULL,
	[Data] [smalldatetime] NULL,
	[IdUser] [int] NULL,
	[Tipo] [varchar](5) NULL,
	[SecondFk] [int] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
