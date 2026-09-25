/****** Object:  Default [DF_S2T_PointOfSale_def_codice_stabilimento]    Script Date: 11/17/2025 15:18:32 ******/
ALTER TABLE [dbo].[S2T_PointOfSale] ADD  CONSTRAINT [DF_S2T_PointOfSale_def_codice_stabilimento]  DEFAULT ([dbo].[S2T_ValoreDefault]('codice_stabilimento')) FOR [def_codice_stabilimento]
GO
