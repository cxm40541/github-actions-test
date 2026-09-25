/****** Object:  Table [dbo].[StabilitaConc]    Script Date: 11/17/2025 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StabilitaConc](
	[IdStabilitaConc] [int] IDENTITY(1,1) NOT NULL,
	[Anno] [int] NULL,
	[MacroConc] [varchar](50) NULL,
	[ImportoPerMacchina] [float] NULL,
	[NumMacchine] [int] NULL,
	[NumRate] [int] NULL,
	[SwStimato] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdStabilitaConc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
