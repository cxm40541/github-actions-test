/****** Object:  ForeignKey [FK_lsrqst_GeV_lsrtit_coni]    Script Date: 11/17/2025 15:18:31 ******/
ALTER TABLE [dbo].[lsrqst_GeV]  WITH NOCHECK ADD  CONSTRAINT [FK_lsrqst_GeV_lsrtit_coni] FOREIGN KEY([lsrqst_GeV_cod_lotto], [lsrqst_GeV_fk_data_ins_tit_gev], [lsrqst_GeV_fk_ora_ins_tit_gev])
REFERENCES [dbo].[lsrtit_coni] ([lsrtit_coni_key_id_ricev], [lsrtit_coni_key_data_ins], [lsrtit_coni_key_ora_ins])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[lsrqst_GeV] CHECK CONSTRAINT [FK_lsrqst_GeV_lsrtit_coni]
GO
