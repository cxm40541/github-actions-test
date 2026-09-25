/****** Object:  Default [DF_StabilitaLocali_LimitaAccumulo]    Script Date: 11/17/2025 15:16:00 ******/
ALTER TABLE [dbo].[StabilitaLocali] ADD  CONSTRAINT [DF_StabilitaLocali_LimitaAccumulo]  DEFAULT ((0)) FOR [LimitaAccumulo]
GO
