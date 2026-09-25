/****** Object:  ForeignKey [FK_lsrser_lotto_lsrpro]    Script Date: 11/17/2025 15:18:31 ******/
ALTER TABLE [dbo].[lsrser_lotto]  WITH NOCHECK ADD  CONSTRAINT [FK_lsrser_lotto_lsrpro] FOREIGN KEY([lsrser_lotto_key_id_ricev], [lsrser_lotto_tipo_provv], [lsrser_lotto_data_provv], [lsrser_lotto_prog_provv])
REFERENCES [dbo].[lsrpro] ([lsrpro_key_id_ricev], [lsrpro_key_tipo_rec], [lsrpro_key_data_provv], [lsrpro_key_prog_provv])
GO
ALTER TABLE [dbo].[lsrser_lotto] NOCHECK CONSTRAINT [FK_lsrser_lotto_lsrpro]
GO
