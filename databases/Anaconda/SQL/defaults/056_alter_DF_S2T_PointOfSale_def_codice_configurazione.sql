/****** Object:  Default [DF_S2T_PointOfSale_def_codice_configurazione]    Script Date: 11/17/2025 15:18:32 ******/
ALTER TABLE [dbo].[S2T_PointOfSale] ADD  CONSTRAINT [DF_S2T_PointOfSale_def_codice_configurazione]  DEFAULT ([dbo].[S2T_ValoreDefault]('codice_configurazione')) FOR [def_codice_configurazione]
GO
