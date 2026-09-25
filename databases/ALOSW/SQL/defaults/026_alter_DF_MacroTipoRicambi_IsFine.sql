/****** Object:  Default [DF_MacroTipoRicambi_IsFine]    Script Date: 11/17/2025 15:15:59 ******/
ALTER TABLE [dbo].[MacroTipoRicambi] ADD  CONSTRAINT [DF_MacroTipoRicambi_IsFine]  DEFAULT ((0)) FOR [IsFine]
GO
