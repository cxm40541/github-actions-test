/****** Object:  Table [dbo].[lsrpro_tra_tipo]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrpro_tra_tipo](
	[lsrpro_tra_codice] [char](1) NOT NULL,
	[descrizione] [char](40) NULL,
 CONSTRAINT [PK_lsrpro_tra_tipo] PRIMARY KEY CLUSTERED 
(
	[lsrpro_tra_codice] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
