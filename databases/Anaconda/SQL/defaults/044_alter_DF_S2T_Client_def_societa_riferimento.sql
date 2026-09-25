/****** Object:  Default [DF_S2T_Client_def_societa_riferimento]    Script Date: 11/17/2025 15:18:31 ******/
ALTER TABLE [dbo].[S2T_Client] ADD  CONSTRAINT [DF_S2T_Client_def_societa_riferimento]  DEFAULT ([dbo].[S2T_ValoreDefault]('societa_riferimento')) FOR [def_societa_riferimento]
GO
