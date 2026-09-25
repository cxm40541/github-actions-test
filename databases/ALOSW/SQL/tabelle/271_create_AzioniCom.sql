/****** Object:  Table [dbo].[AzioniCom]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AzioniCom](
	[IdAzioneCom] [int] IDENTITY(1,1) NOT NULL,
	[FkLocaleCom] [int] NULL,
	[FkProposta] [int] NULL,
	[FkVisita] [int] NULL,
	[FkAgenteAssegnato] [int] NULL,
	[FkAgenteDone] [int] NULL,
	[FkAgenteAdd] [int] NULL,
	[DataIns] [smalldatetime] NULL,
	[DataScadenza] [smalldatetime] NULL,
	[DataEffettuazione] [smalldatetime] NULL,
	[DataReminder] [smalldatetime] NULL,
	[AzioneDescrizione] [varchar](203) NULL,
	[AzioneEsito] [varchar](203) NULL,
	[IdParTipoAzione] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAzioneCom] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
