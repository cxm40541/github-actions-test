/****** Object:  Table [dbo].[QrCode]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QrCode](
	[IdQrCode] [int] IDENTITY(1,1) NOT NULL,
	[FkIncasso] [int] NULL,
	[FkEsattore] [int] NULL,
	[FkDedicato] [int] NULL,
	[Tipo] [varchar](10) NULL,
	[BollettaIncasso] [int] NULL,
	[Data] [smalldatetime] NULL,
	[CodeId] [varchar](50) NULL,
	[Ora] [varchar](10) NULL,
	[DataInizio] [smalldatetime] NULL,
	[OraInizio] [varchar](20) NULL,
	[COININ] [float] NULL,
	[COINOUT] [float] NULL,
	[Hopper1] [float] NULL,
	[Hopper2] [float] NULL,
	[Hopper1Reale] [float] NULL,
	[Hopper2Reale] [float] NULL,
	[Cassa] [float] NULL,
	[REFILL] [float] NULL,
	[CNTTOTIN] [float] NULL,
	[CNTTOTOT] [float] NULL,
	[CNTCL] [float] NULL,
	[CNTIN] [float] NULL,
	[CNTOT] [float] NULL,
	[CNTNT] [float] NULL,
	[IDSK] [varchar](30) NULL,
	[DataIncasso] [smalldatetime] NULL,
	[OraIncasso] [varchar](20) NULL,
	[CNTTOTINPeriodo] [float] NULL,
	[CNTNP] [float] NULL,
	[OTULTCI] [float] NULL,
	[OTPENCI] [float] NULL,
	[DPULTCI] [float] NULL,
	[DPPENCI] [float] NULL,
	[PARZIN] [float] NULL,
	[PARZOUT] [float] NULL,
	[PREU] [float] NULL,
	[RETE] [float] NULL,
	[PERCNOL] [float] NULL,
	[LIVHOP0] [float] NULL,
	[LIVHOP1] [float] NULL,
	[ULTIMOREFILL] [float] NULL,
	[ULTIMAVINCITA] [float] NULL,
	[CNTTOTINANNOPREC] [float] NULL,
	[CNTTOTOTANNOPREC] [float] NULL,
	[Data2] [smalldatetime] NULL,
	[Ora2] [varchar](10) NULL,
	[DataOperazione] [smalldatetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdQrCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
