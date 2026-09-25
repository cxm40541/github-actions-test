/****** Object:  Default [DF_S2T_PointOfSale_scartati_def_data_invio]    Script Date: 11/17/2025 15:18:29 ******/
ALTER TABLE [dbo].[S2T_PointOfSale_scartati] ADD  CONSTRAINT [DF_S2T_PointOfSale_scartati_def_data_invio]  DEFAULT (getdate()) FOR [data_invio]
GO
