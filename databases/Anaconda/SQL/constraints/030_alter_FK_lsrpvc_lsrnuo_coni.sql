/****** Object:  ForeignKey [FK_lsrpvc_lsrnuo_coni]    Script Date: 11/17/2025 15:18:31 ******/
ALTER TABLE [dbo].[lsrpvc]  WITH NOCHECK ADD  CONSTRAINT [FK_lsrpvc_lsrnuo_coni] FOREIGN KEY([lsrpvc_key_id_ricev], [lsrpvc_fk_data_ins_nuo], [lsrpvc_fk_ora_ins_nuo])
REFERENCES [dbo].[lsrnuo_coni] ([lsrnuo_coni_key_id_ricev], [lsrnuo_coni_key_data_ins], [lsrnuo_coni_key_ora_ins])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[lsrpvc] CHECK CONSTRAINT [FK_lsrpvc_lsrnuo_coni]
GO
