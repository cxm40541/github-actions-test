/****** Object:  Table [dbo].[tabxverbali]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tabxverbali](
	[id_piano] [nvarchar](255) NULL,
	[lsr01a_key_id_ricev] [nvarchar](255) NULL,
	[lsr01a_Cod_amm] [nvarchar](255) NULL,
	[progr_terminale] [nvarchar](255) NULL,
	[dedicata] [smalldatetime] NULL,
	[flag] [nvarchar](255) NULL,
	[RUOTA] [nvarchar](255) NULL,
	[ltb01a_PROVINCIA] [nvarchar](255) NULL,
	[lsr01a_tel_ricevitoria] [nvarchar](255) NULL,
	[titolare] [nvarchar](255) NULL,
	[lsr01a_tel_casa] [nvarchar](255) NULL,
	[indirizzo] [nvarchar](255) NULL,
	[HOST] [nvarchar](255) NULL,
	[IP_TERM] [nvarchar](255) NULL,
	[IP_HOST] [nvarchar](255) NULL,
	[IP_FTP] [nvarchar](255) NULL,
	[SUBNET_MASK] [nvarchar](255) NULL,
	[DEFAULT_GATEWAY] [nvarchar](255) NULL,
	[N_verde_ISDN_B] [nvarchar](255) NULL,
	[N_Verde_IP] [nvarchar](255) NULL,
	[USER_FTP] [nvarchar](255) NULL,
	[password FTP] [nvarchar](255) NULL,
	[lsr01a_qta_term] [nvarchar](255) NULL
) ON [DATA]
GO
