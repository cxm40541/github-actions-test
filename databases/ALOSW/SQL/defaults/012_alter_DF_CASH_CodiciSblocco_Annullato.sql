/****** Object:  Default [DF_CASH_CodiciSblocco_Annullato]    Script Date: 11/17/2025 15:15:59 ******/
ALTER TABLE [dbo].[CASH_CodiciSblocco] ADD  CONSTRAINT [DF_CASH_CodiciSblocco_Annullato]  DEFAULT ((0)) FOR [Annullato]
GO
