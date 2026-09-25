/****** Object:  ForeignKey [FK_lsrnuo_GS_lsrtit_coni]    Script Date: 11/17/2025 15:18:31 ******/
ALTER TABLE [dbo].[lsrnuo_GS]  WITH CHECK ADD  CONSTRAINT [FK_lsrnuo_GS_lsrtit_coni] FOREIGN KEY([lsrnuo_GS_key_id_ricev], [lsrnuo_GS_fk_data_ins_tit], [lsrnuo_GS_fk_ora_ins_tit])
REFERENCES [dbo].[lsrtit_coni] ([lsrtit_coni_key_id_ricev], [lsrtit_coni_key_data_ins], [lsrtit_coni_key_ora_ins])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lsrnuo_GS] CHECK CONSTRAINT [FK_lsrnuo_GS_lsrtit_coni]
GO
