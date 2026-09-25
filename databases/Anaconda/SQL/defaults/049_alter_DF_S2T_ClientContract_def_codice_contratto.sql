/****** Object:  Default [DF_S2T_ClientContract_def_codice_contratto]    Script Date: 11/17/2025 15:18:32 ******/
ALTER TABLE [dbo].[S2T_ClientContract] ADD  CONSTRAINT [DF_S2T_ClientContract_def_codice_contratto]  DEFAULT ([dbo].[S2T_ValoreDefault]('codice_contratto')) FOR [def_codice_contratto]
GO
