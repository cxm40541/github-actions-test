/****** Object:  Default [DF_S2T_ClientContract_def_tipo_contratto]    Script Date: 11/17/2025 15:18:32 ******/
ALTER TABLE [dbo].[S2T_ClientContract] ADD  CONSTRAINT [DF_S2T_ClientContract_def_tipo_contratto]  DEFAULT ([dbo].[S2T_ValoreDefault]('tipo_contratto')) FOR [def_tipo_contratto]
GO
