/****** Object:  ForeignKey [FK_lsrrin_coni_lsrtit_coni]    Script Date: 11/17/2025 15:18:31 ******/
ALTER TABLE [dbo].[lsrrin_coni]  WITH CHECK ADD  CONSTRAINT [FK_lsrrin_coni_lsrtit_coni] FOREIGN KEY([lsrrin_coni_key_id_ricev], [lsrrin_coni_fk_data_ins_tit], [lsrrin_coni_fk_ora_ins_tit])
REFERENCES [dbo].[lsrtit_coni] ([lsrtit_coni_key_id_ricev], [lsrtit_coni_key_data_ins], [lsrtit_coni_key_ora_ins])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lsrrin_coni] CHECK CONSTRAINT [FK_lsrrin_coni_lsrtit_coni]
GO
