/****** Object:  ForeignKey [FK_lsrcon_ITVM_lsrtit_coni]    Script Date: 11/17/2025 15:18:31 ******/
ALTER TABLE [dbo].[lsrcon_ITVM]  WITH CHECK ADD  CONSTRAINT [FK_lsrcon_ITVM_lsrtit_coni] FOREIGN KEY([lsrcon_ITVM_cod_lotto], [lsrcon_ITVM_fk_data_ins_tit_gev], [lsrcon_ITVM_fk_ora_ins_tit_gev])
REFERENCES [dbo].[lsrtit_coni] ([lsrtit_coni_key_id_ricev], [lsrtit_coni_key_data_ins], [lsrtit_coni_key_ora_ins])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[lsrcon_ITVM] CHECK CONSTRAINT [FK_lsrcon_ITVM_lsrtit_coni]
GO
