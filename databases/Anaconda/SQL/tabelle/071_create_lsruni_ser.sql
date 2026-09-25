/****** Object:  Table [dbo].[lsruni_ser]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsruni_ser](
	[lsruni_ser_id_ricev] [char](6) NOT NULL,
	[lsruni_ser_cod_ser] [char](3) NOT NULL,
	[lsruni_ser_stato] [char](1) NOT NULL,
	[lsruni_ser_data] [char](8) NOT NULL,
	[lsruni_ser_flag_elab] [char](1) NOT NULL,
 CONSTRAINT [PK_lsruni_ser] PRIMARY KEY CLUSTERED 
(
	[lsruni_ser_id_ricev] ASC,
	[lsruni_ser_cod_ser] ASC,
	[lsruni_ser_data] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
