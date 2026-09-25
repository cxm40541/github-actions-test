/****** Object:  ForeignKey [FK_S2T_ClientContract_S2T_Client]    Script Date: 11/17/2025 15:18:32 ******/
ALTER TABLE [dbo].[S2T_ClientContract]  WITH CHECK ADD  CONSTRAINT [FK_S2T_ClientContract_S2T_Client] FOREIGN KEY([codice_sap_cliente])
REFERENCES [dbo].[S2T_Client] ([codice_sap_cliente])
GO
ALTER TABLE [dbo].[S2T_ClientContract] CHECK CONSTRAINT [FK_S2T_ClientContract_S2T_Client]
GO
