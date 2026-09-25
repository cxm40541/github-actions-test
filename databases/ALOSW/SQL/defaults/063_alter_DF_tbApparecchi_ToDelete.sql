/****** Object:  Default [DF_tbApparecchi_ToDelete]    Script Date: 11/17/2025 15:16:00 ******/
ALTER TABLE [dbo].[tbApparecchi] ADD  CONSTRAINT [DF_tbApparecchi_ToDelete]  DEFAULT ((0)) FOR [ToDelete]
GO
