/****** Object:  Table [dbo].[Lwk04a_Archivio_Attuale_Totobit]    Script Date: 11/17/2025 15:18:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lwk04a_Archivio_Attuale_Totobit](
	[Cod_Lottomatica] [varchar](6) NULL,
	[Denominazione] [varchar](50) NULL,
	[Indirizzo] [varchar](40) NULL,
	[Comune] [varchar](24) NULL,
	[Cap] [varchar](5) NULL,
	[Provincia] [varchar](2) NULL,
	[Partita_IVA] [varchar](11) NULL,
	[ABI] [varchar](5) NULL,
	[CAB] [varchar](5) NULL,
	[conto] [varchar](15) NULL,
	[intestatario] [varchar](60) NULL,
	[flag_storno] [varchar](1) NULL,
	[Tipo_record] [varchar](1) NULL,
	[data_record] [varchar](8) NULL,
	[data_inserimento] [varchar](8) NULL,
	[cod_amministrativo] [varchar](6) NULL,
	[data_validita] [varchar](8) NULL,
	[flag_vos] [smallint] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
