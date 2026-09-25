/****** Object:  Default [DF_lsrpvc_lsrpvc_fk_data_invio_richiesta]    Script Date: 11/17/2025 15:18:31 ******/
ALTER TABLE [dbo].[lsrpvc] ADD  CONSTRAINT [DF_lsrpvc_lsrpvc_fk_data_invio_richiesta]  DEFAULT (0) FOR [lsrpvc_data_crea_file]
GO
