/****** Object:  ForeignKey [FK_lsrord_GeV_lsrtit_coni]    Script Date: 11/17/2025 15:18:30 ******/
ALTER TABLE [dbo].[lsrord_GeV]  WITH NOCHECK ADD  CONSTRAINT [FK_lsrord_GeV_lsrtit_coni] FOREIGN KEY([lsrord_GeV_cod_lotto], [lsrord_GeV_fk_data_ins_tit_gev], [lsrord_GeV_fk_ora_ins_tit_gev])
REFERENCES [dbo].[lsrtit_coni] ([lsrtit_coni_key_id_ricev], [lsrtit_coni_key_data_ins], [lsrtit_coni_key_ora_ins])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[lsrord_GeV] CHECK CONSTRAINT [FK_lsrord_GeV_lsrtit_coni]
GO
