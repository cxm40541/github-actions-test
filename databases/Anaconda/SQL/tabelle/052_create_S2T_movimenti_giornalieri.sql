/****** Object:  Table [dbo].[S2T_movimenti_giornalieri]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[S2T_movimenti_giornalieri](
	[data] [datetime] NOT NULL,
	[catena] [varchar](20) NOT NULL,
	[codice_sgi] [char](7) NOT NULL,
	[codice_lotto] [char](6) NOT NULL,
	[tipo_operazione] [smallint] NOT NULL,
	[carta] [smallint] NOT NULL,
 CONSTRAINT [PK_S2T_Movimenti_Giornalieri] PRIMARY KEY CLUSTERED 
(
	[data] ASC,
	[catena] ASC,
	[codice_sgi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
