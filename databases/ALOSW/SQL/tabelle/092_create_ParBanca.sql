/****** Object:  Table [dbo].[ParBanca]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ParBanca](
	[IdParBanca] [int] IDENTITY(1,1) NOT NULL,
	[TextBanca] [nvarchar](50) NULL,
	[Indirizzo] [varchar](200) NULL,
	[Citta] [varchar](200) NULL,
	[Cap] [varchar](200) NULL,
	[CodiceCliente] [varchar](200) NULL,
	[Web] [varchar](200) NULL,
	[Referente] [varchar](200) NULL,
	[IBAN] [varchar](50) NULL,
	[ABI] [varchar](20) NULL,
	[CAB] [varchar](20) NULL,
	[NumeroConto] [varchar](30) NULL,
	[SIA] [varchar](30) NULL,
	[SpeseBonifico] [float] NULL,
	[SpeseRiba] [float] NULL,
	[FkSocieta] [int] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
