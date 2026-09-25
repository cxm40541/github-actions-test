/****** Object:  Table [dbo].[dismissioni_padgate]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dismissioni_padgate](
	[idDismissione] [int] IDENTITY(1,1) NOT NULL,
	[dataDismissione] [smalldatetime] NULL,
	[codiceRicambioSparato] [varchar](50) NULL,
	[identificativoSlot] [varchar](50) NULL,
	[tipoApparecchio] [varchar](50) NULL,
	[motivazione] [varchar](300) NULL,
	[provenienza] [varchar](100) NULL,
	[note] [varchar](300) NULL,
	[nomeRicambioScheda] [varchar](50) NULL,
	[codiceRicambioScheda] [varchar](50) NULL,
	[idMagazzinoScheda] [int] NULL,
	[nomeRicambioMobile] [varchar](50) NULL,
	[codiceRicambioMobile] [varchar](50) NULL,
	[idMagazzinoMobile] [int] NULL,
	[nomeTecnico] [varchar](50) NULL,
	[processato] [bit] NULL,
 CONSTRAINT [PK_dismissioni_padgate_1] PRIMARY KEY CLUSTERED 
(
	[idDismissione] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
