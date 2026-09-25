/****** Object:  Default [DF_S2T_Client_inviati_def_data_invio]    Script Date: 11/17/2025 15:18:30 ******/
ALTER TABLE [dbo].[S2T_Client_inviati] ADD  CONSTRAINT [DF_S2T_Client_inviati_def_data_invio]  DEFAULT (getdate()) FOR [data_invio]
GO
