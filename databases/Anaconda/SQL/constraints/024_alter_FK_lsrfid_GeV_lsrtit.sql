/****** Object:  ForeignKey [FK_lsrfid_GeV_lsrtit]    Script Date: 11/17/2025 15:18:31 ******/
ALTER TABLE [dbo].[lsrfid_GeV]  WITH NOCHECK ADD  CONSTRAINT [FK_lsrfid_GeV_lsrtit] FOREIGN KEY([lsrfid_GeV_cod_lotto], [lsrfid_GeV_fk_data_ins_tit], [lsrfid_GeV_fk_ora_ins_tit])
REFERENCES [dbo].[lsrtit] ([lsrtit_key_id_ricev], [lsrtit_key_data_ins], [lsrtit_key_ora_ins])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[lsrfid_GeV] CHECK CONSTRAINT [FK_lsrfid_GeV_lsrtit]
GO
