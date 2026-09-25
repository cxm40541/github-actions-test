/****** Object:  ForeignKey [FK_lsrcon_ITVM_matr_lsrcon_ITVM]    Script Date: 11/17/2025 15:18:31 ******/
ALTER TABLE [dbo].[lsrcon_ITVM_matr]  WITH CHECK ADD  CONSTRAINT [FK_lsrcon_ITVM_matr_lsrcon_ITVM] FOREIGN KEY([lsrcon_ITVM_matr_key_id_ricev], [lsrcon_ITVM_matr_key_data_ins], [lsrcon_ITVM_matr_key_ora_ins])
REFERENCES [dbo].[lsrcon_ITVM] ([lsrcon_ITVM_key_id_ricev], [lsrcon_ITVM_key_data_ins], [lsrcon_ITVM_key_ora_ins])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lsrcon_ITVM_matr] CHECK CONSTRAINT [FK_lsrcon_ITVM_matr_lsrcon_ITVM]
GO
