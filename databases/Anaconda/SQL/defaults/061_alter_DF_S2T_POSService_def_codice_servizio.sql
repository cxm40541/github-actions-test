/****** Object:  Default [DF_S2T_POSService_def_codice_servizio]    Script Date: 11/17/2025 15:18:32 ******/
ALTER TABLE [dbo].[S2T_POSService] ADD  CONSTRAINT [DF_S2T_POSService_def_codice_servizio]  DEFAULT ([dbo].[S2T_ValoreDefault]('codice_servizio')) FOR [def_codice_servizio]
GO
