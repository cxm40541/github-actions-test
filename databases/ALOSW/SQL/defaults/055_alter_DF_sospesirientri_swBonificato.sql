/****** Object:  Default [DF_sospesirientri_swBonificato]    Script Date: 11/17/2025 15:15:59 ******/
ALTER TABLE [dbo].[SospesiRientri] ADD  CONSTRAINT [DF_sospesirientri_swBonificato]  DEFAULT ((0)) FOR [swBonificato]
GO
