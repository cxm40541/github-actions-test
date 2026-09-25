/****** Object:  Table [dbo].[CAMBIA_VNE_Storico]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CAMBIA_VNE_Storico](
	[Pk] [int] IDENTITY(1,1) NOT NULL,
	[Fk] [int] NULL,
	[sn] [varchar](80) NULL,
	[vendor] [varchar](80) NULL,
	[giorno] [smalldatetime] NULL,
	[firstupdate] [smalldatetime] NULL,
	[lastupdate] [smalldatetime] NULL,
	[scoinin] [float] NULL,
	[scoinout] [float] NULL,
	[snotein] [float] NULL,
	[snoteout] [float] NULL,
	[stip01] [varchar](80) NULL,
	[scnt01] [float] NULL,
	[sval01] [float] NULL,
	[stip02] [varchar](80) NULL,
	[scnt02] [float] NULL,
	[sval02] [float] NULL,
	[stip03] [varchar](80) NULL,
	[scnt03] [float] NULL,
	[sval03] [float] NULL,
	[stip04] [varchar](80) NULL,
	[scnt04] [float] NULL,
	[sval04] [float] NULL,
	[stip05] [varchar](80) NULL,
	[scnt05] [float] NULL,
	[sval05] [float] NULL,
	[stip06] [varchar](80) NULL,
	[scnt06] [float] NULL,
	[sval06] [float] NULL,
	[stip07] [varchar](80) NULL,
	[scnt07] [float] NULL,
	[sval07] [float] NULL,
	[stip08] [varchar](80) NULL,
	[scnt08] [float] NULL,
	[sval08] [float] NULL,
	[coinin] [float] NULL,
	[coinout] [float] NULL,
	[notein] [float] NULL,
	[noteout] [float] NULL,
	[tip01] [varchar](80) NULL,
	[cnt01] [float] NULL,
	[val01] [float] NULL,
	[tip02] [varchar](80) NULL,
	[cnt02] [float] NULL,
	[val02] [float] NULL,
	[tip03] [varchar](80) NULL,
	[cnt03] [float] NULL,
	[val03] [float] NULL,
	[tip04] [varchar](80) NULL,
	[cnt04] [float] NULL,
	[val04] [float] NULL,
	[tip05] [varchar](80) NULL,
	[cnt05] [float] NULL,
	[val05] [float] NULL,
	[tip06] [varchar](80) NULL,
	[cnt06] [float] NULL,
	[val06] [float] NULL,
	[tip07] [varchar](80) NULL,
	[cnt07] [float] NULL,
	[val07] [float] NULL,
	[tip08] [varchar](80) NULL,
	[cnt08] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Pk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
