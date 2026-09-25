/****** Object:  Table [dbo].[RicambiDismissione]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RicambiDismissione](
	[IdDismissione] [int] IDENTITY(1,1) NOT NULL,
	[Data] [smalldatetime] NULL,
	[Identificativo] [varchar](20) NULL,
	[Tipo] [varchar](20) NULL,
	[Motivazione] [varchar](100) NULL,
	[Provenienza] [varchar](100) NULL,
	[Note] [varchar](100) NULL,
	[fkUser] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDismissione] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
