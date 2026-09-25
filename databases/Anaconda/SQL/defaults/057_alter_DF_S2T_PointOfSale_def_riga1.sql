/****** Object:  Default [DF_S2T_PointOfSale_def_riga1]    Script Date: 11/17/2025 15:18:32 ******/
ALTER TABLE [dbo].[S2T_PointOfSale] ADD  CONSTRAINT [DF_S2T_PointOfSale_def_riga1]  DEFAULT ([dbo].[S2T_ValoreDefault]('riga1')) FOR [def_riga1]
GO
