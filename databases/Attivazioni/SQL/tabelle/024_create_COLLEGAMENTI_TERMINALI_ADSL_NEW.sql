/****** Object:  Table [dbo].[COLLEGAMENTI_TERMINALI_ADSL_NEW]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COLLEGAMENTI_TERMINALI_ADSL_NEW](
	[nter] [char](7) NOT NULL,
	[CODOR] [char](5) NOT NULL,
	[SDLC] [char](2) NOT NULL,
	[NUM_RICEV] [smallint] NOT NULL,
	[PROV_RICEV] [char](2) NOT NULL,
	[STAT] [char](1) NULL,
	[TD] [varchar](13) NULL,
	[RET2] [varchar](2) NULL,
	[TIPO_T] [varchar](4) NULL,
	[NUAT] [varchar](15) NULL,
	[PORTA_T] [varchar](15) NULL,
	[TGU_T] [varchar](13) NULL,
	[NODO_T] [varchar](15) NULL,
	[N_VERDE] [smallint] NULL,
	[N_VERDE2] [smallint] NULL,
	[ID_AMMINISTRATIVO] [char](6) NOT NULL,
	[ID_LOTTOMATICA] [char](6) NOT NULL,
	[PROGR_TERMINALE] [char](1) NOT NULL,
	[LOTTO] [char](5) NULL,
	[DATA_ORDINE] [datetime] NULL,
	[lotto_telecom] [varchar](5) NOT NULL,
	[DEFAULT_GATEWAY] [char](15) NULL,
	[SUBNET_MASK] [char](15) NULL,
	[IP_FTP] [char](15) NULL,
	[VISTA] [char](1) NULL,
	[TD_ADSL] [char](20) NULL,
	[MOD_ROUTER] [char](30) NULL,
	[INFO_NODO] [char](30) NULL,
	[IP_RETE] [char](15) NULL,
	[IP_BROADCAST] [char](15) NULL,
	[NOTE] [varchar](50) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
