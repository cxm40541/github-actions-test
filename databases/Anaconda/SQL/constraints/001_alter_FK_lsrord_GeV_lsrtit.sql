/****** Object:  ForeignKey [FK_lsrord_GeV_lsrtit]    Script Date: 11/17/2025 15:18:30 ******/
ALTER TABLE [dbo].[lsrord_GeV]  WITH NOCHECK ADD  CONSTRAINT [FK_lsrord_GeV_lsrtit] FOREIGN KEY([lsrord_GeV_cod_lotto], [lsrord_GeV_fk_data_ins_tit], [lsrord_GeV_fk_ora_ins_tit])
REFERENCES [dbo].[lsrtit] ([lsrtit_key_id_ricev], [lsrtit_key_data_ins], [lsrtit_key_ora_ins])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[lsrord_GeV] CHECK CONSTRAINT [FK_lsrord_GeV_lsrtit]
GO
