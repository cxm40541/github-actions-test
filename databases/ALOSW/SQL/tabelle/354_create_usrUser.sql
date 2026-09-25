/****** Object:  Table [dbo].[usrUser]    Script Date: 11/17/2025 15:16:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usrUser](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[UserId] [nvarchar](50) NULL,
	[UserPWD] [nvarchar](50) NULL,
	[IsAdmin] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[ParamManager] [bit] NOT NULL,
	[CurrentSpid] [int] NULL,
	[SqlWhere] [varchar](500) NULL,
	[IsAdminMacro] [bit] NULL,
	[IdAzienda] [int] NULL,
	[UserNameClear] [varchar](100) NULL,
	[LastIp] [varchar](50) NULL,
	[LastSession] [varchar](50) NULL,
	[bNoUsrUser] [bit] NULL,
	[sIdlocale] [nvarchar](500) NULL,
	[sWebFunction] [varchar](250) NULL,
	[CasseEscluse] [varchar](255) NULL,
	[UserPWD1] [varchar](50) NULL,
	[UserPWD2] [varchar](50) NULL,
	[UserPWD3] [varchar](50) NULL,
	[UserPWD4] [varchar](50) NULL,
	[nPassword] [int] NULL,
	[DataScadenza] [smalldatetime] NULL,
 CONSTRAINT [PK_usrUser] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
