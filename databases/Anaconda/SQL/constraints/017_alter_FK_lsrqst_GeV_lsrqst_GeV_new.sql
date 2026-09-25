/****** Object:  ForeignKey [FK_lsrqst_GeV_lsrqst_GeV_new]    Script Date: 11/17/2025 15:18:31 ******/
ALTER TABLE [dbo].[lsrqst_GeV]  WITH CHECK ADD  CONSTRAINT [FK_lsrqst_GeV_lsrqst_GeV_new] FOREIGN KEY([lsrqst_GeV_key_id_ricev], [lsrqst_Gev_fk_data_ins_qst_new], [lsrqst_Gev_fk_ora_ins_qst_new])
REFERENCES [dbo].[lsrqst_GeV_new] ([lsrqst_GeV_key_id_ricev], [lsrqst_GeV_key_data_ins], [lsrqst_GeV_key_ora_ins])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[lsrqst_GeV] CHECK CONSTRAINT [FK_lsrqst_GeV_lsrqst_GeV_new]
GO
