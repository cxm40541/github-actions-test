/****** Object:  Table [dbo].[lsrcon_ITVM_matr]    Script Date: 11/17/2025 15:18:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lsrcon_ITVM_matr](
	[lsrcon_ITVM_matr_key_id_ricev] [char](7) NOT NULL,
	[lsrcon_ITVM_matr_key_data_ins] [char](8) NOT NULL,
	[lsrcon_ITVM_matr_key_ora_ins] [char](8) NOT NULL,
	[lsrcon_ITVM_matr_cod_lotto] [char](6) NULL,
	[lsrcon_ITVM_matr_num_term] [int] NOT NULL,
	[lsrcon_ITVM_matr_matricola] [char](30) NULL,
	[lsrcon_ITVM_matr_firma] [char](17) NULL,
 CONSTRAINT [PK_lsrcon_ITVM_matr] PRIMARY KEY CLUSTERED 
(
	[lsrcon_ITVM_matr_key_id_ricev] ASC,
	[lsrcon_ITVM_matr_key_data_ins] ASC,
	[lsrcon_ITVM_matr_key_ora_ins] ASC,
	[lsrcon_ITVM_matr_num_term] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
