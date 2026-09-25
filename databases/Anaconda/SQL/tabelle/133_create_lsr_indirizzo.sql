/****** Object:  Table [dbo].[lsr_indirizzo]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsr_indirizzo](
	[lsr01a_key_id_ricev] [char](6) NOT NULL,
	[lsr01a_indirizzo] [char](40) NULL,
	[lsr01a_tel_ricevitoria] [char](12) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
