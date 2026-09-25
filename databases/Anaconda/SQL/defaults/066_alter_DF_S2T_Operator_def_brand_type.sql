/****** Object:  Default [DF_S2T_Operator_def_brand_type]    Script Date: 11/17/2025 15:18:32 ******/
ALTER TABLE [dbo].[S2T_Operator] ADD  CONSTRAINT [DF_S2T_Operator_def_brand_type]  DEFAULT ([dbo].[S2T_ValoreDefault]('brand_type')) FOR [def_brand_type]
GO
