/****** Object:  ForeignKey [FK_lsrfid_gp_lsrtit_coni]    Script Date: 11/17/2025 15:18:31 ******/
ALTER TABLE [dbo].[lsrfid_gp]  WITH NOCHECK ADD  CONSTRAINT [FK_lsrfid_gp_lsrtit_coni] FOREIGN KEY([lsrfid_gp_key_id_ricev], [lsrfid_gp_fk_data_ins_tit], [lsrfid_gp_fk_ora_ins_tit])
REFERENCES [dbo].[lsrtit_coni] ([lsrtit_coni_key_id_ricev], [lsrtit_coni_key_data_ins], [lsrtit_coni_key_ora_ins])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lsrfid_gp] CHECK CONSTRAINT [FK_lsrfid_gp_lsrtit_coni]
GO
