/****** Object:  Table [dbo].[CAMBIA_Storico]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CAMBIA_Storico](
	[Pk] [int] IDENTITY(1,1) NOT NULL,
	[Fk] [int] NULL,
	[sn] [varchar](80) NULL,
	[vendor] [varchar](80) NULL,
	[giorno] [smalldatetime] NULL,
	[firstupdate] [smalldatetime] NULL,
	[lastupdate] [smalldatetime] NULL,
	[stotmonete] [float] NULL,
	[stotbanconote] [float] NULL,
	[stotale] [float] NULL,
	[totmonete] [float] NULL,
	[totbanconote] [float] NULL,
	[totale] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
