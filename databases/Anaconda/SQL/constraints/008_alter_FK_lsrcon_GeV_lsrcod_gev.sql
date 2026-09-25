/****** Object:  ForeignKey [FK_lsrcon_GeV_lsrcod_gev]    Script Date: 11/17/2025 15:18:30 ******/
ALTER TABLE [dbo].[lsrcon_GeV]  WITH NOCHECK ADD  CONSTRAINT [FK_lsrcon_GeV_lsrcod_gev] FOREIGN KEY([lsrcon_Gev_cod_merce])
REFERENCES [dbo].[lsrcod_gev] ([lsrcod_gev_codice])
GO
ALTER TABLE [dbo].[lsrcon_GeV] CHECK CONSTRAINT [FK_lsrcon_GeV_lsrcod_gev]
GO
