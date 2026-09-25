/****** Object:  ForeignKey [FK_lsrcon_GeV_lsrtit_coni]    Script Date: 11/17/2025 15:18:30 ******/
ALTER TABLE [dbo].[lsrcon_GeV]  WITH NOCHECK ADD  CONSTRAINT [FK_lsrcon_GeV_lsrtit_coni] FOREIGN KEY([lsrcon_GeV_cod_lotto], [lsrcon_GeV_fk_data_ins_tit_gev], [lsrcon_GeV_fk_ora_ins_tit_gev])
REFERENCES [dbo].[lsrtit_coni] ([lsrtit_coni_key_id_ricev], [lsrtit_coni_key_data_ins], [lsrtit_coni_key_ora_ins])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[lsrcon_GeV] CHECK CONSTRAINT [FK_lsrcon_GeV_lsrtit_coni]
GO
