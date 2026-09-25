/****** Object:  Table [dbo].[lst0ea]    Script Date: 11/17/2025 15:21:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lst0ea](
	[lst0ea_key_id_ricev] [char](6) NOT NULL,
	[lst0ea_key_matricola] [char](20) NOT NULL,
	[lst0ea_tipo] [char](4) NULL,
	[lst0ea_data_inst] [char](8) NULL,
	[lst0ea_data_disinst] [char](8) NULL,
	[lst0ea_badge_inst] [char](7) NULL,
	[lst0ea_badge_disinst] [char](7) NULL,
 CONSTRAINT [PK_lst0ea] PRIMARY KEY CLUSTERED 
(
	[lst0ea_key_id_ricev] ASC,
	[lst0ea_key_matricola] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [DATA]
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
