/****** Object:  Default [DF_S2T_ClientContract_inviati_def_esito]    Script Date: 11/17/2025 15:18:30 ******/
ALTER TABLE [dbo].[S2T_ClientContract_inviati] ADD  CONSTRAINT [DF_S2T_ClientContract_inviati_def_esito]  DEFAULT (255) FOR [esito]
GO
