/****** Object:  ForeignKey [FK_lsrcon_coni_lsrtit_coni]    Script Date: 11/17/2025 15:18:31 ******/
ALTER TABLE [dbo].[lsrcon_coni]  WITH CHECK ADD  CONSTRAINT [FK_lsrcon_coni_lsrtit_coni] FOREIGN KEY([lsrcon_coni_key_id_ricev], [lsrcon_coni_fk_data_ins_tit], [lsrcon_coni_fk_ora_ins_tit])
REFERENCES [dbo].[lsrtit_coni] ([lsrtit_coni_key_id_ricev], [lsrtit_coni_key_data_ins], [lsrtit_coni_key_ora_ins])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lsrcon_coni] CHECK CONSTRAINT [FK_lsrcon_coni_lsrtit_coni]
GO
