/****** Object:  Default [DF_ConfigTreeView_bNoTreeView]    Script Date: 11/17/2025 15:15:59 ******/
ALTER TABLE [dbo].[ConfigTreeView] ADD  CONSTRAINT [DF_ConfigTreeView_bNoTreeView]  DEFAULT ((0)) FOR [bNoTreeView]
GO
