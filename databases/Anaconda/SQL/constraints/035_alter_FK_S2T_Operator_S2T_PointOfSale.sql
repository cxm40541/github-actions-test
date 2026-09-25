/****** Object:  ForeignKey [FK_S2T_Operator_S2T_PointOfSale]    Script Date: 11/17/2025 15:18:32 ******/
ALTER TABLE [dbo].[S2T_Operator]  WITH CHECK ADD  CONSTRAINT [FK_S2T_Operator_S2T_PointOfSale] FOREIGN KEY([codice_sap_pos])
REFERENCES [dbo].[S2T_PointOfSale] ([codice_sap_pos])
GO
ALTER TABLE [dbo].[S2T_Operator] CHECK CONSTRAINT [FK_S2T_Operator_S2T_PointOfSale]
GO
