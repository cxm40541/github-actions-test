/****** Object:  Table [dbo].[OPERAZIONI]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OPERAZIONI](
	[id_user] [char](15) NOT NULL,
	[tipo_operazione] [char](1) NOT NULL,
	[ricevitoria] [char](6) NOT NULL,
	[piano] [char](15) NOT NULL,
	[tabella] [char](30) NOT NULL,
	[data] [datetime] NOT NULL,
	[query] [varchar](250) NOT NULL,
	[campo_id] [int] IDENTITY(1,1) NOT NULL,
	[cod_probl] [char](5) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
