/****** Object:  Default [DF_S2T_Client_def_sia]    Script Date: 11/17/2025 15:18:31 ******/
ALTER TABLE [dbo].[S2T_Client] ADD  CONSTRAINT [DF_S2T_Client_def_sia]  DEFAULT ([dbo].[S2T_ValoreDefault]('sia')) FOR [def_sia]
GO
