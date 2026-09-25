/****** Object:  Table [dbo].[lsrser_lis_dec]    Script Date: 11/17/2025 15:18:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrser_lis_dec](
	[lsrser_lis_dec_categoria] [char](2) NOT NULL,
	[lsrser_lis_dec_servizio] [char](2) NOT NULL,
	[lsrser_lis_dec_attivita] [char](2) NOT NULL,
	[lsrser_lis_dec_nome] [char](40) NOT NULL,
	[lsrser_lis_dec_nome_tab] [char](15) NULL,
	[lsrser_lis_cod_servizio] [char](2) NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
