/****** Object:  Default [DF_S2T_Client_def_vbo]    Script Date: 11/17/2025 15:18:31 ******/
ALTER TABLE [dbo].[S2T_Client] ADD  CONSTRAINT [DF_S2T_Client_def_vbo]  DEFAULT ([dbo].[S2T_ValoreDefault]('vbo')) FOR [def_vbo]
GO
