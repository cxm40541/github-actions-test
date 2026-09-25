/****** Object:  ForeignKey [FK_lsrtlp_st_lsrtit_coni]    Script Date: 11/17/2025 15:18:31 ******/
ALTER TABLE [dbo].[lsrtlp_st]  WITH CHECK ADD  CONSTRAINT [FK_lsrtlp_st_lsrtit_coni] FOREIGN KEY([lsrtlp_st_key_id_ricev], [lsrtlp_st_fk_data_ins_tit], [lsrtlp_st_fk_ora_ins_tit])
REFERENCES [dbo].[lsrtit_coni] ([lsrtit_coni_key_id_ricev], [lsrtit_coni_key_data_ins], [lsrtit_coni_key_ora_ins])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lsrtlp_st] CHECK CONSTRAINT [FK_lsrtlp_st_lsrtit_coni]
GO
