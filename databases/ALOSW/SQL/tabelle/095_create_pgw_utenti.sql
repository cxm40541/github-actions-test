/****** Object:  Table [dbo].[pgw_utenti]    Script Date: 11/17/2025 15:15:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pgw_utenti](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](32) NOT NULL,
	[user_password] [varchar](32) NULL,
	[tipo_utente] [varchar](32) NOT NULL,
	[tipo_profilo] [varchar](32) NOT NULL,
	[last_access] [datetime] NULL,
	[access_cnt] [int] NULL,
	[last_psw_changed] [datetime] NULL,
	[psw_must_change] [varchar](1) NOT NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
