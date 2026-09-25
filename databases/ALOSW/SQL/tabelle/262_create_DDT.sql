/****** Object:  Table [dbo].[DDT]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DDT](
	[IdDDT] [int] IDENTITY(1,1) NOT NULL,
	[numero] [varchar](20) NULL,
	[Data] [smalldatetime] NULL,
	[MitDen] [nvarchar](100) NULL,
	[MitInd] [nvarchar](150) NULL,
	[MitPR] [nvarchar](2) NULL,
	[MitCitta] [nvarchar](150) NULL,
	[MitCap] [nvarchar](10) NULL,
	[DesDen] [nvarchar](100) NULL,
	[DesInd] [nvarchar](150) NULL,
	[DesPR] [nvarchar](2) NULL,
	[DesCitta] [nvarchar](150) NULL,
	[DesCap] [nvarchar](10) NULL,
	[MitPIVA] [nvarchar](20) NULL,
	[Testo] [nvarchar](150) NULL,
	[Qta] [int] NULL,
	[Codice] [nvarchar](20) NULL,
	[NoteDDT] [char](255) NULL,
	[ParCausaleDDT] [int] NULL,
	[NColli] [int] NULL,
	[Porto] [char](30) NULL,
	[Beni] [char](50) NULL,
	[Persona] [int] NULL,
	[DesInd2] [char](150) NULL,
	[DesPr2] [char](2) NULL,
	[DesCAP2] [char](10) NULL,
	[DesCitta2] [char](150) NULL,
	[DesDen2] [char](150) NULL,
	[IdSocieta] [int] NULL,
	[NoteVettore] [varchar](100) NULL,
	[Info1] [varchar](250) NULL,
	[bInfo1] [bit] NULL,
	[Info2] [varchar](250) NULL,
	[bInfo2] [bit] NULL,
	[Info3] [varchar](250) NULL,
	[bInfo3] [bit] NULL,
	[InfoVarie] [varchar](250) NULL,
	[NotePDA] [varchar](255) NULL,
	[DesPIVA] [varchar](20) NULL,
	[DesPIVA2] [varchar](20) NULL,
	[Peso] [varchar](20) NULL,
	[ParStatoDDT] [int] NULL,
	[TipoMittente] [varchar](1) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
