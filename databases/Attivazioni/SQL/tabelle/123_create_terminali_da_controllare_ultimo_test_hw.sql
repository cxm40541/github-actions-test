/****** Object:  Table [dbo].[terminali_da_controllare_ultimo_test_hw]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[terminali_da_controllare_ultimo_test_hw](
	[ricevitoria] [char](6) NULL,
	[terminale] [char](1) NULL,
	[data_sostituzione] [char](8) NULL,
	[data_e_ora_sostituzione] [datetime] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
