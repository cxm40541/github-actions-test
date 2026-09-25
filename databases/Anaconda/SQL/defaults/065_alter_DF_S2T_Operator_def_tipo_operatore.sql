/****** Object:  Default [DF_S2T_Operator_def_tipo_operatore]    Script Date: 11/17/2025 15:18:32 ******/
ALTER TABLE [dbo].[S2T_Operator] ADD  CONSTRAINT [DF_S2T_Operator_def_tipo_operatore]  DEFAULT ([dbo].[S2T_ValoreDefault]('tipo_operatore')) FOR [def_tipo_operatore]
GO
