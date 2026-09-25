/****** Object:  Default [DF_S2T_ClientContract_def_societa_riferimento]    Script Date: 11/17/2025 15:18:32 ******/
ALTER TABLE [dbo].[S2T_ClientContract] ADD  CONSTRAINT [DF_S2T_ClientContract_def_societa_riferimento]  DEFAULT ([dbo].[S2T_ValoreDefault]('societa_riferimento')) FOR [def_societa_riferimento]
GO
