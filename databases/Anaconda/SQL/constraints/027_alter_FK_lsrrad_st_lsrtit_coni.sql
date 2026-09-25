/****** Object:  ForeignKey [FK_lsrrad_st_lsrtit_coni]    Script Date: 11/17/2025 15:18:31 ******/
ALTER TABLE [dbo].[lsrrad_st]  WITH CHECK ADD  CONSTRAINT [FK_lsrrad_st_lsrtit_coni] FOREIGN KEY([lsrrad_st_key_id_ricev], [lsrrad_st_fk_data_ins_tit], [lsrrad_st_fk_ora_ins_tit])
REFERENCES [dbo].[lsrtit_coni] ([lsrtit_coni_key_id_ricev], [lsrtit_coni_key_data_ins], [lsrtit_coni_key_ora_ins])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lsrrad_st] CHECK CONSTRAINT [FK_lsrrad_st_lsrtit_coni]
GO
