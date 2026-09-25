/****** Object:  ForeignKey [FK_lsrcon_ITVM_lsrtit]    Script Date: 11/17/2025 15:18:31 ******/
ALTER TABLE [dbo].[lsrcon_ITVM]  WITH CHECK ADD  CONSTRAINT [FK_lsrcon_ITVM_lsrtit] FOREIGN KEY([lsrcon_ITVM_cod_lotto], [lsrcon_ITVM_fk_data_ins_tit], [lsrcon_ITVM_fk_ora_ins_tit])
REFERENCES [dbo].[lsrtit] ([lsrtit_key_id_ricev], [lsrtit_key_data_ins], [lsrtit_key_ora_ins])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[lsrcon_ITVM] CHECK CONSTRAINT [FK_lsrcon_ITVM_lsrtit]
GO
