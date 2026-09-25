/****** Object:  Table [dbo].[indirizzi_REMS]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[indirizzi_REMS](
	[key_id_ricev] [char](6) NOT NULL,
	[comune_ricev] [varchar](200) NULL,
	[prov_ricev] [char](2) NULL,
	[cap] [char](5) NULL,
	[indirizzo] [varchar](200) NULL,
	[cod_fisc] [varchar](20) NULL,
	[p_iva] [varchar](20) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
