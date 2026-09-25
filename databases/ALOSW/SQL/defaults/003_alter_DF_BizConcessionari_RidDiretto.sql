/****** Object:  Default [DF_BizConcessionari_RidDiretto]    Script Date: 11/17/2025 15:15:59 ******/
ALTER TABLE [dbo].[bizConcessionari] ADD  CONSTRAINT [DF_BizConcessionari_RidDiretto]  DEFAULT (0) FOR [RidDiretto]
GO
