/****** Object:  ForeignKey [FK_lsrrad_GeV_lsrtit]    Script Date: 11/17/2025 15:18:30 ******/
ALTER TABLE [dbo].[lsrrad_GeV]  WITH CHECK ADD  CONSTRAINT [FK_lsrrad_GeV_lsrtit] FOREIGN KEY([lsrrad_cod_lotto], [lsrrad_fk_data_ins_tit], [lsrrad_fk_ora_ins_tit])
REFERENCES [dbo].[lsrtit] ([lsrtit_key_id_ricev], [lsrtit_key_data_ins], [lsrtit_key_ora_ins])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[lsrrad_GeV] CHECK CONSTRAINT [FK_lsrrad_GeV_lsrtit]
GO
