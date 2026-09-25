/****** Object:  Default [DF_S2T_versioni_file_dataoramodifica]    Script Date: 11/17/2025 15:18:29 ******/
ALTER TABLE [dbo].[S2T_versioni_file] ADD  CONSTRAINT [DF_S2T_versioni_file_dataoramodifica]  DEFAULT (getdate()) FOR [dataoramodifica]
GO
