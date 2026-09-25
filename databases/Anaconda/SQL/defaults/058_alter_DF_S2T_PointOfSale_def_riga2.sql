/****** Object:  Default [DF_S2T_PointOfSale_def_riga2]    Script Date: 11/17/2025 15:18:32 ******/
ALTER TABLE [dbo].[S2T_PointOfSale] ADD  CONSTRAINT [DF_S2T_PointOfSale_def_riga2]  DEFAULT ([dbo].[S2T_ValoreDefault]('riga2')) FOR [def_riga2]
GO
