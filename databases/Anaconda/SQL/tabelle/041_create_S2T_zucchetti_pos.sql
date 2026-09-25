/****** Object:  Table [dbo].[S2T_zucchetti_pos]    Script Date: 11/17/2025 15:18:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[S2T_zucchetti_pos](
	[codice_zucchetti_pos_numerico] [int] IDENTITY(1,1) NOT NULL,
	[codice_zucchetti_pos] [char](5) NULL,
	[ultima_carta] [int] NULL,
	[codice_lotto] [char](6) NULL,
	[codice_sgi] [char](7) NULL,
	[dataoracreazione] [datetime] NULL,
	[dataoramodifica] [datetime] NULL
) ON [DATA]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'getdate()' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'S2T_zucchetti_pos', @level2type=N'COLUMN',@level2name=N'dataoracreazione'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'getdate()' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'S2T_zucchetti_pos', @level2type=N'COLUMN',@level2name=N'dataoramodifica'
GO
