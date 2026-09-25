/****** Object:  ForeignKey [FK_lsrnuo_coni_lsrtit_coni]    Script Date: 11/17/2025 15:18:31 ******/
ALTER TABLE [dbo].[lsrnuo_coni]  WITH NOCHECK ADD  CONSTRAINT [FK_lsrnuo_coni_lsrtit_coni] FOREIGN KEY([lsrnuo_coni_key_id_ricev], [lsrnuo_coni_fk_data_ins_tit], [lsrnuo_coni_fk_ora_ins_tit])
REFERENCES [dbo].[lsrtit_coni] ([lsrtit_coni_key_id_ricev], [lsrtit_coni_key_data_ins], [lsrtit_coni_key_ora_ins])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lsrnuo_coni] CHECK CONSTRAINT [FK_lsrnuo_coni_lsrtit_coni]
GO
