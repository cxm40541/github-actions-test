/****** Object:  Default [DF_CASH_LocaleBonus_Attivo]    Script Date: 11/17/2025 15:15:59 ******/
ALTER TABLE [dbo].[CASH_LocaleBonus] ADD  CONSTRAINT [DF_CASH_LocaleBonus_Attivo]  DEFAULT ((0)) FOR [Attivo]
GO
