/****** Object:  Default [DF_S2T_Operator_inviati_def_esito]    Script Date: 11/17/2025 15:18:29 ******/
ALTER TABLE [dbo].[S2T_Operator_inviati] ADD  CONSTRAINT [DF_S2T_Operator_inviati_def_esito]  DEFAULT (255) FOR [esito]
GO
