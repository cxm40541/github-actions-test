/****** Object:  Table [dbo].[S2T_zucchetti_cliente]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[S2T_zucchetti_cliente](
	[codice_zucchetti_cliente_numerico] [int] IDENTITY(1,1) NOT NULL,
	[codice_zucchetti_cliente] [char](5) NULL,
	[codice_lotto] [char](6) NULL,
	[codice_sgi] [char](7) NULL,
	[dataoracreazione] [datetime] NULL,
	[dataoramodifica] [datetime] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
